provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "risky_sg" {
  name = "risky_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open SSH access to the world
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Open outbound traffic to the world
  }
}

resource "aws_iam_user" "risky_user" {
  name = "risky_user"

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",  # Over-privileged access
  ]
}
