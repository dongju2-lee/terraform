# Bastion EC2 SG
resource "aws_security_group" "bastion_ec2"{
    name        = "${var.project_name}-${var.environment}-bastion-sg"
    description = "for bastion ec2"
    vpc_id      = aws_vpc.vpc.id

    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-bastion-sg"
  }
}
