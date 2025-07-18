resource "aws_route53_zone" "babaji-zone"{
  name = var.domainname
  comment = "public hosted zone for ${var.domainname}"
}
resource "aws_route53_record" "babaji-rcord"{
  zone_id = aws_route53_zone.babaji-zone.id
  name = var.domainname
  type = "A"
  alias {
    evaluate_target_health = true
    name                   = var.elb_dns_name
    zone_id                = var.elb_zone_id
  }
}