# Frontend accepting traffic from frontend ALB
resource "aws_security_group_rule" "backend_alb_bastion" {
   type              = "ingress"
   security_group_id = local.backend_alb_sg_id # backend_alb_sg_id SG ID
   source_security_group_id = local.bastion_sg_id # bastion_sg_id SG ID
   from_port         = 80
   protocol          = "tcp"
   to_port           = 80
}

resource "aws_security_group_rule" "bastion_laptop" {
   type              = "ingress"
   security_group_id = local.bastion_sg_id # backend_alb_sg_id SG ID
   cidr_blocks = ["0.0.0.0/0"] # bastion_sg_id SG ID
   from_port         = 22
   protocol          = "tcp"
   to_port           = 22
}
# mongodb sg rule to accept traffic from bastion
resource "aws_security_group_rule" "mongodb_bastion" {
   type              = "ingress"
   security_group_id = local.mongodb_sg_id # backend_alb_sg_id SG ID
   source_security_group_id = local.bastion_sg_id # bastion_sg_id SG ID
   from_port         = 22
   protocol          = "tcp"
   to_port           = 22
}

resource "aws_security_group_rule" "redis_bastion" {
   type              = "ingress"
   security_group_id = local.redis_sg_id # backend_alb_sg_id SG ID
   source_security_group_id = local.bastion_sg_id # bastion_sg_id SG ID
   from_port         = 22
   protocol          = "tcp"
   to_port           = 22
}

resource "aws_security_group_rule" "rabbitmq_bastion" {
   type              = "ingress"
   security_group_id = local.rabbitmq_sg_id # backend_alb_sg_id SG ID
   source_security_group_id = local.bastion_sg_id # bastion_sg_id SG ID
   from_port         = 22
   protocol          = "tcp"
   to_port           = 22
}

resource "aws_security_group_rule" "mysql_bastion" {
   type              = "ingress"
   security_group_id = local.mysql_sg_id # backend_alb_sg_id SG ID
   source_security_group_id = local.bastion_sg_id # bastion_sg_id SG ID
   from_port         = 22
   protocol          = "tcp"
   to_port           = 22
}

resource "aws_security_group_rule" "catalogue_bastion" {
   type              = "ingress"
   security_group_id = local.catalogue_sg_id # backend_alb_sg_id SG ID
   source_security_group_id = local.bastion_sg_id # bastion_sg_id SG ID
   from_port         = 22
   protocol          = "tcp"
   to_port           = 22
}

resource "aws_security_group_rule" "mongodb_catalogue" {
   type              = "ingress"
   security_group_id = local.mongodb_sg_id # backend_alb_sg_id SG ID
   source_security_group_id = local.catalogue_sg_id # bastion_sg_id SG ID
   from_port         = 27017
   protocol          = "tcp"
   to_port           = 27017
}