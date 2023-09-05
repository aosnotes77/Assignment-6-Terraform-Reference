# create iam role 
resource "aws_iam_role" "s3_full_access_role" {
  name = "S3FullAccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# attach the aws manage s3 full access policy to the iam role
resource "aws_iam_role_policy_attachment" "s3_full_access_policy_attachment" {
  role       = 
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# create an iam instance profile
resource "aws_iam_instance_profile" "s3_full_access_instance_profile" {
  name = 
  role = 
}
