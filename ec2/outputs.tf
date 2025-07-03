output "instance_ids" {
  value = [
    aws_instance.babaji_web.id,
    aws_instance.babaji_web1.id,
  ]
}


