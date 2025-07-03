module "vpc" {
  source = "git::https://github.com/ckrrajeshkumar/route53.git//vpc?ref=master"
  vpccidr = var.vpccidr
  vpcname = var.vpcname
  pubcidr1 = var.pubcidr1
  pubaz1 = var.pubaz1
  pubcidr2 = var.pubcidr2
  pubaz2 = var.pubaz2
  pubsubname1 = var.pubsubname1
  pubsubname2 = var.pubsubname2
  igwname = var.igwname
  igwcidr = var.igwcidr
  rtname = var.rtname
}
module "sg" {
  source = "git::https://github.com/ckrrajeshkumar/route53.git//sg?ref=master"
  vpc_id = module.vpc.vpc1
  block1 = var.block1
  block2 = var.block2
  block3 = var.block3
  sgname = var.sgname
}
module "ec2"{
  source = "git::https://github.com/ckrrajeshkumar/route53.git//ec2?ref=master"
  amiid = var.amiid
  intype = var.intype
  security_group_id = module.sg.sg_id
  keypair = var.keypair
  subnet_id1 = module.vpc.subnet1_id
  subnet_id2 = module.vpc.subnet2_id
  ec2name1 = var.ec2name1
  ec2name2 = var.ec2name2
}
module "elb"{
  source = "git::https://github.com/ckrrajeshkumar/route53.git//elb?ref=master"
  elbname = var.elbname
  security_group_id = module.sg.sg_id
  sg_id = module.sg.sg_id
  subnet_id= [module.vpc.subnet1_id, module.vpc.subnet2_id]
  instance_ids = module.ec2.instance_ids
}
module "r53"{
  source = "git::https://github.com/ckrrajeshkumar/route53.git//r53?ref=master"
  domainname =var.domainname
  elb_dns = module.elb.dns_name
  elb_zone_id = var.elb_zone_id
}