resource "aws_launch_configuration" "ecs" {
    name_prefix = "ECS ${var.cluster_name}--"
    image_id = "${lookup(var.amis, var.region)}"
    instance_type = "${var.instance_type}"
    iam_instance_profile = "${aws_iam_instance_profile.ecs_instance_profile.name}"
    key_name = "${var.key_name}"
    security_groups = ["${var.security_group_ids}"]
    user_data = "#!/bin/bash\necho ECS_CLUSTER=${var.cluster_name} > /etc/ecs/ecs.config && echo ECS_ENGINE_AUTH_TYPE=dockercfg >> /etc/ecs/ecs.config && echo ECS_ENGINE_AUTH_DATA='{\"${var.registry_url}\":{\"auth\":\"${var.registry_auth}\",\"email\":\"${var.registry_email}\"}}' >> /etc/ecs/ecs.config\nyum -y update ecs-init\n${var.ecs_user_data}"
    associate_public_ip_address = "${var.associate_public_ip_address}"

    lifecycle { create_before_destroy = true }

    root_block_device {
      volume_type = "${var.root_block_device_type}"
      volume_size = "${var.root_block_device_size}"
      iops = "${var.root_block_device_iops}"
      delete_on_termination = "${var.root_block_device_delete}"
    }
    ebs_block_device {
      device_name = "${var.ebs_block_device_name}"
      volume_type = "${var.ebs_block_device_type}"
      volume_size = "${var.ebs_block_device_size}"
      iops = "${var.ebs_block_device_iops}"
      delete_on_termination = "${var.ebs_block_device_delete}"
    }
}
