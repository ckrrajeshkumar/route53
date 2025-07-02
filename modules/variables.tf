variable "vpccidr"{}
variable "vpcname"{}
variable "pubcidr"{
  type= list(any)
}
variable "az"{
  type= list(any)
}
variable "igwname"{}
variable "igwcidr"{}
variable "rtname"{}
variable "block1"{
  type = list(any)
}
variable "block2"{
  type = list(any)
}
variable "block3"{
  type = list(any)
}
variable "sgname"{}
variable "amiid"{}
variable "intype"{}
variable "elbname"{}
variable "domainname"{}
variable "elb_dns"{}
variable "elb_zone_id"{}
