output "Master ELB Address" {
  value = "${module.dcos.master_elb_address}"
}

output "Public Agent ELB Address" {
  value = "${module.dcos.public_agent_elb_address}"
}

output "Mesos Master Public IP" {
  value = "${module.dcos.mesos_master_public_ip}"
}

output "Private Agent Public IP Address" {
  value = "${module.dcos.private_agent_public_ip}"
}

output "Public Agent Public IP Address" {
  value = "${module.dcos.public_agent_public_ip}"
}

output "Bootstrap Public IP Address" {
  value = "${module.dcos.bootstrap_public_ip}"
}
