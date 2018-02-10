# Modern Cloud Infrastructure with Terraform

## Variables and outputs

### Initializing Terraform

```
$ terraform init

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your environment. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## Set your private SSH key location

In `main.tf` file replace the following line with a path to your private SSH key:

```
      private_key = "${file("~/.ssh/tfworkshop")}"
```

### Dry-run Terraform definition

```
$ terraform plan -out terraform.plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed. Cyan entries are data sources to be read.

Your plan was also saved to the path below. Call the "apply" subcommand
with this plan file and Terraform will exactly execute this execution
plan.

Path: terraform.plan

+ aws_instance.instance
    ami:                          "ami-da28dfa3"
    associate_public_ip_address:  "<computed>"
    availability_zone:            "<computed>"
    ebs_block_device.#:           "<computed>"
    ephemeral_block_device.#:     "<computed>"
    instance_state:               "<computed>"
    instance_type:                "t2.micro"
    ipv6_address_count:           "<computed>"
    ipv6_addresses.#:             "<computed>"
    key_name:                     "${var.workshop_key_name}-${random_id.random.hex}"
    network_interface.#:          "<computed>"
    network_interface_id:         "<computed>"
    placement_group:              "<computed>"
    primary_network_interface_id: "<computed>"
    private_dns:                  "<computed>"
    private_ip:                   "<computed>"
    public_dns:                   "<computed>"
    public_ip:                    "<computed>"
    root_block_device.#:          "<computed>"
    security_groups.#:            "<computed>"
    source_dest_check:            "true"
    subnet_id:                    "<computed>"
    tags.%:                       "<computed>"
    tenancy:                      "<computed>"
    volume_tags.%:                "<computed>"
    vpc_security_group_ids.#:     "<computed>"

+ aws_key_pair.workshop
    fingerprint: "<computed>"
    key_name:    "${var.workshop_key_name}-${random_id.random.hex}"
    public_key:  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8vL+aeWwmTVvcPt+uCzA7ydrrPAwy2LJ1v80iTJ1lmzT31h7hAcLf4gAT3sZzwC0qU+jCyllj252F3PJ2D19ol9LX5ObLuVxPbFzOaf0X2DE+GLb7tdIl+oQgcoKXfukZTK+rL79Z0YmfNdKgqURTn4vT1m41HsMsn57SOZ0dQlKIHI3z2fxZ7dZ7ft2pM4FgC4BbVAK3iekf3u4Fi8QdAcOCPd3AfpZstwfKCU5SOoY68HTvG8e/+eGKAhs25FLGZLv5SNJyuNJnZkoA54CWTc3zi+rvA5ZN2ivh1IgRfPKNnAo+5xyjerMJGvBCNUdBc7fYiMF+vwlnAeyk40qt kamsz@Kamils-MBP"

+ aws_security_group.open
    description:                          "Allow all ingress/egress traffic"
    egress.#:                             "1"
    egress.482069346.cidr_blocks.#:       "1"
    egress.482069346.cidr_blocks.0:       "0.0.0.0/0"
    egress.482069346.from_port:           "0"
    egress.482069346.ipv6_cidr_blocks.#:  "0"
    egress.482069346.prefix_list_ids.#:   "0"
    egress.482069346.protocol:            "-1"
    egress.482069346.security_groups.#:   "0"
    egress.482069346.self:                "false"
    egress.482069346.to_port:             "0"
    ingress.#:                            "1"
    ingress.482069346.cidr_blocks.#:      "1"
    ingress.482069346.cidr_blocks.0:      "0.0.0.0/0"
    ingress.482069346.from_port:          "0"
    ingress.482069346.ipv6_cidr_blocks.#: "0"
    ingress.482069346.protocol:           "-1"
    ingress.482069346.security_groups.#:  "0"
    ingress.482069346.self:               "false"
    ingress.482069346.to_port:            "0"
    name:                                 "allow_all"
    owner_id:                             "<computed>"
    tags.%:                               "<computed>"
    vpc_id:                               "<computed>"

+ random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"


Plan: 4 to add, 0 to change, 0 to destroy.
```

### Create the resources

```
$ terraform apply terraform.plan
random_id.random: Creating...
  b64:         "" => "<computed>"
  b64_std:     "" => "<computed>"
  b64_url:     "" => "<computed>"
  byte_length: "" => "8"
  dec:         "" => "<computed>"
  hex:         "" => "<computed>"
random_id.random: Creation complete (ID: ZPygb_49xeM)
aws_key_pair.workshop: Creating...
  fingerprint: "" => "<computed>"
  key_name:    "" => "workshop_key-64fca06ffe3dc5e3"
  public_key:  "" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8vL+aeWwmTVvcPt+uCzA7ydrrPAwy2LJ1v80iTJ1lmzT31h7hAcLf4gAT3sZzwC0qU+jCyllj252F3PJ2D19ol9LX5ObLuVxPbFzOaf0X2DE+GLb7tdIl+oQgcoKXfukZTK+rL79Z0YmfNdKgqURTn4vT1m41HsMsn57SOZ0dQlKIHI3z2fxZ7dZ7ft2pM4FgC4BbVAK3iekf3u4Fi8QdAcOCPd3AfpZstwfKCU5SOoY68HTvG8e/+eGKAhs25FLGZLv5SNJyuNJnZkoA54CWTc3zi+rvA5ZN2ivh1IgRfPKNnAo+5xyjerMJGvBCNUdBc7fYiMF+vwlnAeyk40qt kamsz@Kamils-MBP"
aws_security_group.open: Creating...
  description:                          "" => "Allow all ingress/egress traffic"
  egress.#:                             "" => "1"
  egress.482069346.cidr_blocks.#:       "" => "1"
  egress.482069346.cidr_blocks.0:       "" => "0.0.0.0/0"
  egress.482069346.from_port:           "" => "0"
  egress.482069346.ipv6_cidr_blocks.#:  "" => "0"
  egress.482069346.prefix_list_ids.#:   "" => "0"
  egress.482069346.protocol:            "" => "-1"
  egress.482069346.security_groups.#:   "" => "0"
  egress.482069346.self:                "" => "false"
  egress.482069346.to_port:             "" => "0"
  ingress.#:                            "" => "1"
  ingress.482069346.cidr_blocks.#:      "" => "1"
  ingress.482069346.cidr_blocks.0:      "" => "0.0.0.0/0"
  ingress.482069346.from_port:          "" => "0"
  ingress.482069346.ipv6_cidr_blocks.#: "" => "0"
  ingress.482069346.protocol:           "" => "-1"
  ingress.482069346.security_groups.#:  "" => "0"
  ingress.482069346.self:               "" => "false"
  ingress.482069346.to_port:            "" => "0"
  name:                                 "" => "allow_all"
  owner_id:                             "" => "<computed>"
  tags.%:                               "" => "1"
  tags.Name:                            "" => "tfworkshop-64fca06ffe3dc5e3"
  vpc_id:                               "" => "<computed>"
aws_key_pair.workshop: Creation complete (ID: workshop_key-64fca06ffe3dc5e3)
aws_security_group.open: Creation complete (ID: sg-728efd0a)
aws_instance.instance: Creating...
  ami:                               "" => "ami-da28dfa3"
  associate_public_ip_address:       "" => "<computed>"
  availability_zone:                 "" => "<computed>"
  ebs_block_device.#:                "" => "<computed>"
  ephemeral_block_device.#:          "" => "<computed>"
  instance_state:                    "" => "<computed>"
  instance_type:                     "" => "t2.micro"
  ipv6_address_count:                "" => "<computed>"
  ipv6_addresses.#:                  "" => "<computed>"
  key_name:                          "" => "workshop_key-64fca06ffe3dc5e3"
  network_interface.#:               "" => "<computed>"
  network_interface_id:              "" => "<computed>"
  placement_group:                   "" => "<computed>"
  primary_network_interface_id:      "" => "<computed>"
  private_dns:                       "" => "<computed>"
  private_ip:                        "" => "<computed>"
  public_dns:                        "" => "<computed>"
  public_ip:                         "" => "<computed>"
  root_block_device.#:               "" => "<computed>"
  security_groups.#:                 "" => "<computed>"
  source_dest_check:                 "" => "true"
  subnet_id:                         "" => "<computed>"
  tags.%:                            "" => "1"
  tags.Name:                         "" => "tfworkshop-64fca06ffe3dc5e3"
  tenancy:                           "" => "<computed>"
  volume_tags.%:                     "" => "<computed>"
  vpc_security_group_ids.#:          "" => "1"
  vpc_security_group_ids.4054695967: "" => "sg-728efd0a"
aws_instance.instance: Still creating... (10s elapsed)
aws_instance.instance: Still creating... (20s elapsed)
aws_instance.instance: Provisioning with 'remote-exec'...
aws_instance.instance (remote-exec): Connecting to remote host via SSH...
aws_instance.instance (remote-exec):   Host: 34.253.191.126
aws_instance.instance (remote-exec):   User: ubuntu
aws_instance.instance (remote-exec):   Password: false
aws_instance.instance (remote-exec):   Private key: true
aws_instance.instance (remote-exec):   SSH Agent: true
aws_instance.instance (remote-exec): Connected!
aws_instance.instance (remote-exec): Linux ip-172-31-29-103 4.4.0-1028-aws #37-Ubuntu SMP Tue Aug 1 18:54:28 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
aws_instance.instance: Creation complete (ID: i-05f125e0597e29769)

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path:

Outputs:

public_ip = 34.253.191.126
```

### Destroy the resources

```
$ terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

random_id.random: Refreshing state... (ID: ZPygb_49xeM)
aws_security_group.open: Refreshing state... (ID: sg-728efd0a)
aws_key_pair.workshop: Refreshing state... (ID: workshop_key-64fca06ffe3dc5e3)
aws_instance.instance: Refreshing state... (ID: i-05f125e0597e29769)
aws_instance.instance: Destroying... (ID: i-05f125e0597e29769)
aws_key_pair.workshop: Destroying... (ID: workshop_key-64fca06ffe3dc5e3)
aws_key_pair.workshop: Destruction complete
aws_instance.instance: Still destroying... (ID: i-05f125e0597e29769, 10s elapsed)
aws_instance.instance: Still destroying... (ID: i-05f125e0597e29769, 20s elapsed)
aws_instance.instance: Still destroying... (ID: i-05f125e0597e29769, 30s elapsed)
aws_instance.instance: Still destroying... (ID: i-05f125e0597e29769, 40s elapsed)
aws_instance.instance: Still destroying... (ID: i-05f125e0597e29769, 50s elapsed)
aws_instance.instance: Destruction complete
aws_security_group.open: Destroying... (ID: sg-728efd0a)
aws_security_group.open: Destruction complete
random_id.random: Destroying... (ID: ZPygb_49xeM)
random_id.random: Destruction complete

Destroy complete! Resources: 4 destroyed.
```
