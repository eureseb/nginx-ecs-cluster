
We will be looking to understand how you architect, plan, communicate, and automate your solution to build a high-availability infrastructure on cloud services.

## Requirements:


1. Use Infrastructure as Code (IaC) principles to provision and manage the infrastructure. Choose a tool of your preference (e.g., Terraform, AWS CloudFormation, etc.). ✅

2. Set up ECS clusters with Fargate launch type for hosting Nginx containers. Ensure that containers are spread across multiple Availability Zones (AZs) for High Availability (HA). ✅

Link for Nginx Docker Image https://hub.docker.com/r/dmartinezlchka/nginx-host

3. Configure an Application Load Balancer (ALB) to distribute traffic to the Nginx containers. Ensure proper health checks are in place. ✅

4. Implement centralised logging and monitoring for the ECS service and ALB using AWS CloudWatch or any other monitoring tool you prefer. ✅

5. Ensure security best practices are followed throughout the infrastructure setup. ✅



## Deliverables:

1. Complete IaC scripts or templates to provision the infrastructure on AWS on a Git repository (Github / Gitlab / Bitbucket). Ensure the repo is private and invite Landchecker members for the challenge review.

2. Documentation and diagrams explaining your infrastructure design, including scalability, monitoring, and security considerations

3. Any additional insights or optimisations that were implemented.

## Submission Notes:

1. It should be deployed using a custom Virtual Private Cloud (VPC) on any region.

2. The infrastructure is not required to be running when you submit.

3. The Landchecker team will use the provided scripts to create the necessary infrastructure for validating the challenge.