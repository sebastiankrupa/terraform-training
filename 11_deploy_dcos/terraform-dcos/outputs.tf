output "master_elb_address" {
  value = "${aws_elb.public-master-elb.dns_name}"
}

output "public_agent_elb_address" {
  value = "${aws_elb.public-agent-elb.dns_name}"
}

output "mesos_master_public_ip" {
  value = ["${aws_instance.master.*.public_ip}"]
}

output "private_agent_public_ip" {
  value = ["${aws_instance.agent.*.public_ip}"]
}

output "public_agent_public_ip" {
  value = ["${aws_instance.public-agent.*.public_ip}"]
}

output "bootstrap_public_ip" {
  value = "${aws_instance.bootstrap.public_ip}"
}
