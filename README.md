AWS CI/CD Pipeline Demo with GitHub Actions
This repository demonstrates a CI/CD pipeline using GitHub Actions to deploy a Node.js Express application on an AWS EC2 instance. Infrastructure is provisioned using Terraform.
Architecture

Source: GitHub repository (this repo).
CI/CD: GitHub Actions workflow builds the Node.js app, zips it, uploads it to an S3 bucket, and deploys it to an EC2 instance via SSH.
Infrastructure: Terraform provisions an EC2 instance, S3 bucket for artifacts, and IAM roles for S3 access.
Deployment: The app is copied to the EC2 instance, dependencies are installed, and the app is started.

Prerequisites

AWS account with appropriate permissions.
Node.js and npm installed locally for testing.
Terraform installed for infrastructure provisioning.
AWS CLI configured with credentials.
An EC2 key pair for SSH access.
GitHub repository with secrets configured (see Setup GitHub Secrets).

Setup GitHub Secrets

Go to your repository on GitHub: https://github.com/soodrajesh/AWS-CICD-Pipeline-Demo.
Navigate to Settings > Secrets and variables > Actions > New repository secret.
Add the following secrets:
AWS_ACCESS_KEY_ID: Your AWS access key ID.
AWS_SECRET_ACCESS_KEY: Your AWS secret access key.
AWS_REGION: Your AWS region (e.g., us-east-1).
S3_BUCKET: The name of the S3 bucket created by Terraform (e.g., aws-cicd-demo-artifacts-<random-suffix>, found via terraform output or AWS S3 Console).
EC2_HOST: The public IP or DNS of the EC2 instance (found in AWS EC2 Console after running Terraform).
EC2_SSH_KEY: The private key of your EC2 key pair (contents of the .pem file).



Quick Start

Clone the repository:
git clone https://github.com/soodrajesh/AWS-CICD-Pipeline-Demo.git
cd AWS-CICD-Pipeline-Demo


Set up infrastructure with Terraform:
cd terraform
terraform init
terraform apply

Update terraform.tfvars with your AWS region, AMI ID, and EC2 key pair name. After applying, note the S3 bucket name and EC2 public IP/DNS for GitHub Secrets.

Configure GitHub Actions:

Ensure the .github/workflows/deploy.yml file is in your repository.
Set up the GitHub secrets as described above.


Run the app locally (optional):
npm install
npm start

Visit http://localhost:3000 to test the app.

Push changes to trigger the pipeline:
git add .
git commit -m "Initial commit"
git push origin main

The GitHub Actions workflow will build, upload, and deploy the app to the EC2 instance.


Files

.github/workflows/deploy.yml: GitHub Actions workflow for CI/CD.
app.js: Node.js Express application.
package.json: Node.js dependencies and scripts.
terraform/: Terraform files for provisioning infrastructure.

Notes

Update the AMI ID in terraform.tfvars with a valid AMI for your region (e.g., Amazon Linux 2, found in AWS EC2 Console).
Ensure the EC2 key pair exists in AWS and is specified in terraform.tfvars.
The security group allows HTTP (port 3000) and SSH (port 22) traffic. For production, restrict SSH access to your IP.
The EC2 instance is configured with Node.js and AWS CLI via Terraform's user_data script.
The deployment script runs npm start & to start the app in the background; consider using a process manager like PM2 for production.
Find the S3 bucket name in the Terraform output (terraform output) or AWS S3 Console after running terraform apply.

License
MIT