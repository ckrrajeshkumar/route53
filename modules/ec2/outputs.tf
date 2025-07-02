output "instance_ids" {
  value = [
    aws_instance.babaji-web.id,
    aws_instance.babaji-web1.id,
  ]
}


