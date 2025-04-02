output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.web.public_ip
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.my_bucket.bucket
}

output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.mydb.endpoint
}