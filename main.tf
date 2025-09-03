module "vpc" {
  source          = "./VPC"
  name            = "vpc-tag"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.4.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.8.0/24", "10.0.11.0/24"]
  azs             =  ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}


module "ec2_instance" {
  source              = "./EC2"
  instance_name       = "Demo"
  ami                 = "ami-02d26659fd82cf299"
  instance_type       = "t2.micro"
  key                 = "demo-key"
  public_ip           = true
  subnet_id           = module.vpc.public_subnet_ids[0]
  vpc_id              = module.vpc.vpc_id
  security_group      = [module.ec2_instance.security_group_id]
  security_group_name = "Demo-sg"
  ingress_ports = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}


module "rds" {
  source             = "./RDS"
  name               = "rds-tag"
  db_name            = "mydb"
  username           = "admin"
  password           = "Admin12345"
  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = [module.ec2_instance.security_group_id]
}

module "S3" {
  source = "./S3"
  bucketname = "prathameshbews3bucket"
  enable_versioning = "Enabled"
}

