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

