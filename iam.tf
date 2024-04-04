data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "systems_manager" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

data "aws_iam_policy" "cloudwatch_agent" {
  arn = "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
}

# IAM Role
## bastion
resource "aws_iam_role" "bastion" {
  name               = "${var.project_name}-${var.environment}-bastion-iamrole"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_role_policy_attachment" "bastion_ssm" {
  role       = aws_iam_role.bastion.name
  policy_arn = data.aws_iam_policy.systems_manager.arn
}

resource "aws_iam_role_policy_attachment" "bastion_cloudwatch" {
  role       = aws_iam_role.bastion.name
  policy_arn = data.aws_iam_policy.cloudwatch_agent.arn
}

resource "aws_iam_instance_profile" "bastion" {
  name = "${var.project_name}-${var.environment}-bastion-instanceprofile"
  role = aws_iam_role.bastion.name
}

