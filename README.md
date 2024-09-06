This project demonstrates how to deploy a static website to AWS S3 using Terraform. The website files (index.html and error.html) are hosted in an S3 bucket configured for website hosting.

Project Structure:

	•	providers.tf: Specifies the AWS provider and any necessary credentials.
	•	main.tf: Contains the core Terraform configuration for creating the S3 bucket, uploading the website files, and configuring S3 static website hosting.
	•	variables.tf: Defines the input variables used in the Terraform configuration for more flexibility and reusability.
	•	index.html: The main page of the static website.
	•	error.html: The error page displayed when users encounter a 404 error on the website.

Prerequisites:

	•	AWS account with the necessary permissions to create S3 buckets.
	•	Terraform installed.
	•	AWS CLI configured locally or proper credentials configured through environment variables.

Setup Instructions:

    1.  Clone the repository
    2.  Update variables.tf
    3.  Initialize terraform (terraform init)
    4.  Apply the terraform configuration (terraform apply)
    5.  Access the website using the s3 endpoint
    6.  cleanup - destroy the services to avoid ongoing costs (terraform destroy)