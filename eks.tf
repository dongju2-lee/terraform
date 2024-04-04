
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = "devops-dj-eks"
  cluster_version = "1.28"

  vpc_id                         = aws_vpc.vpc.id
  subnet_ids                     = [aws_subnet.private1.id,aws_subnet.private2.id]
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }
  }
}

