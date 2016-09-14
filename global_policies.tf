# IAM Role for ECS Instances in EC2
resource "aws_iam_role" "ecs_instance_role" {
  name = "ecsInstanceRole-${var.cluster_name}"
  assume_role_policy = "${file("${path.module}/files/aws_trusts/ecs_instance_role_trust.json")}"
}

# IAM Role for ECS Service (access to ELB)
resource "aws_iam_role" "ecs_service_role" {
  name = "ecsServiceRole-${var.cluster_name}"
  assume_role_policy = "${file("${path.module}/files/aws_trusts/ecs_service_role_trust.json")}"
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerServiceforEC2Role" {
  role = "${aws_iam_role.ecs_instance_role.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerServiceRole" {
  role = "${aws_iam_role.ecs_service_role.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

# Create an instance profile for this ecsInstanceRole.  This is assigned to the machine
# to allow it to assume the ecsInstanceRole (basically like an anonymous account that can be
# assumed by EC2 resources).
resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "${aws_iam_role.ecs_instance_role.name}"
  roles = ["${aws_iam_role.ecs_instance_role.name}"]
}
