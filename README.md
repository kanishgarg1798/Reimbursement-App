# README

This project uses Google Sign-In for user Authentication, but access is restricted to specific Google accounts. The integration is implemented using the Devise gem along with OmniAuth for Google OAuth2.

Ruby version 3.0.0
Rails version 7.0

Google Developer Console Setup:
1. Create a new project in the Google Developer Console.
2. Configure OAuth consent screen and create OAuth 2.0 credentials (Client ID and Client Secret).
3. Add the Client ID and Secret to credentials.yml.

Document Upload to AWS S3
This project also supports uploading documents to an AWS S3 bucket using Active Storage.

1. AWS S3 Setup:
    Create an S3 bucket in the AWS Management Console.
    Configure the bucket's permission to allow your application to upload files.

2. Rails Config:
    Add AWS credentials to your credentials.yml
