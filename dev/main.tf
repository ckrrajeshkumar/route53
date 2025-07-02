module "vpc" {
  source = "git::https://github.com/ckrrajeshkumar/route53.git//modules/vpc?ref=master"
  vpccidr = var.vpccidr
  vpcname = var.vpcname
  pubcidr = var.pubcidr
  az = var.az
  igwname = var.igwname
  igwcidr = var.igwcidr
  rtname = var.rtname
}
module "sg"{
  source = "git::https://github.com/ckrrajeshkumar/route53.git//modules/sg?ref=master"
  vpc_id = module.vpc.vpc_id
  block1 = var.block1
  block2 = var.block2
  block3 = var.block3
  sgname = var.sgname
}
module "ec2"{
  source = "git::https://github.com/ckrrajeshkumar/route53.git//modules/ec2?ref=master"
  amiid = var.amiid
  intype = var.intype
  security_group_id = module.sg.sg_id
  keypair = var.keypair
  subnet_id = module.vpc.subnet_ids
}
module "elb"{
  source = "git::https://github.com/ckrrajeshkumar/route53.git//modules/elb?ref=master"
  elbname = var.elbname
  sg_id = var.sg_id
  subnet_ids = var.subnet_ids
  instance_ids = var.instance_ids
}
module "r53"{
  source = "git::https://github.com/ckrrajeshkumar/route53.git//modules/r53?ref=master"
  domainname =var.domainname
  elb_dns = module.elb.elb_dnsname
  elb_zone_id = var.elb_zone_id
}