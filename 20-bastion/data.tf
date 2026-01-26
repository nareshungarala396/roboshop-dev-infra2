  data "aws_ami" "joindevops" {
      most_recent = true
      owners      = ["336468392098"] # Or your AWS account ID if it's a custom AMI

      filter {
        name   = "name"
        values = ["Redhat-9-DevOps-Practice"] # Example: Amazon Linux 2 AMI
      }

      filter {
        name   = ""root-device-type""
        values = ["ebs"]
      }

      filter {
        name   = "virtualization-type"
        values = ["hvm"]
      }
    }

    output "ami_id" {
        value = data.aws_ami.joindevops.id
    }


data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project_name}/${var.environment}/bastion_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}