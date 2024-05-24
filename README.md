# Terraform Project for AWS ECS Cluster - Fargate instance type

## Introduction

This project sets up an ECS Cluster that has [nginx](https://hub.docker.com/r/dmartinezlchka/nginx-host) containers that are accessed via an Application Load Balancer (ALB) in AWS with access logging enabled.
The logs are stored in an S3 bucket.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) >= 0.12
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS account with appropriate permissions

## Configuration

### Variables

There are many variables used in this project, most of them I have put default values.

But for the project to work on your AWS account, these values are needed:

- `profile`: The AWS profile saved in your AWS CLI
- `aws_account_id`: Your AWS account ID.
- `bucket_name`: Buckets have a global namespace, this bucket will be used to store ALB Access logs

Define these variables in the `terraform.tfvars` file:

```hcl
# Sample:
profile         = "eurese-iam-account"
aws_account_id  = 123456789012
bucket_name     = "alb-accesslogs-timestamp"
```

### Note:
- If you do not have a terraform.tfvars file, create one in the "/environments/dev" directory beforehand.
- If you want to set up this project in a Region other than the default one(ap-southeast-1 : Singapore), you must also change the `elb-account-id` variable.
Gotten [here](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/enable-access-logging.html).


## Usage

IMPORTANT: make sure you are in the "/environments/dev" directory before you initialize.

1. Initialize Terraform

Run the following command to initialize the Terraform configuration:
```sh
terraform init
```

2. Plan the Infrastructure

Run the following command to see an execution plan:
```sh
terraform plan
```

3. Apply the Configuration

Run the following command to apply the Terraform configuration:
```sh
terraform apply
```
Type `yes` when prompted to confirm the apply action.

4. Outputs

After applying the configuration, Terraform will output the ALB DNS name. You can use these outputs to access your ALB.

##  Clean Up
To destroy the resources created by this project, run:
```sh
terraform destroy
```
Type `yes` when prompted to confirm the destruction.


## Notes
* Ensure your AWS credentials are configured correctly using the AWS CLI or environment variables.
* The S3 bucket name must be globally unique. Adjust the bucket name if you encounter issues.