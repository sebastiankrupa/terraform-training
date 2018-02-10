# Modern Cloud Infrastructure with Terraform

## Accessing your EC2 instance

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
    key_name:                     "workshop_key-${random_id.random.hex}"
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
    key_name:    "workshop_key-${random_id.random.hex}"
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
random_id.random: Creation complete (ID: CB4yM51yvzM)
aws_key_pair.workshop: Creating...
  fingerprint: "" => "<computed>"
  key_name:    "" => "workshop_key-081e32339d72bf33"
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
  tags.Name:                            "" => "tfworkshop-081e32339d72bf33"
  vpc_id:                               "" => "<computed>"
aws_key_pair.workshop: Creation complete (ID: workshop_key-081e32339d72bf33)
aws_security_group.open: Creation complete (ID: sg-8485f6fc)
aws_instance.instance: Creating...
  ami:                              "" => "ami-da28dfa3"
  associate_public_ip_address:      "" => "<computed>"
  availability_zone:                "" => "<computed>"
  ebs_block_device.#:               "" => "<computed>"
  ephemeral_block_device.#:         "" => "<computed>"
  instance_state:                   "" => "<computed>"
  instance_type:                    "" => "t2.micro"
  ipv6_address_count:               "" => "<computed>"
  ipv6_addresses.#:                 "" => "<computed>"
  key_name:                         "" => "workshop_key-081e32339d72bf33"
  network_interface.#:              "" => "<computed>"
  network_interface_id:             "" => "<computed>"
  placement_group:                  "" => "<computed>"
  primary_network_interface_id:     "" => "<computed>"
  private_dns:                      "" => "<computed>"
  private_ip:                       "" => "<computed>"
  public_dns:                       "" => "<computed>"
  public_ip:                        "" => "<computed>"
  root_block_device.#:              "" => "<computed>"
  security_groups.#:                "" => "<computed>"
  source_dest_check:                "" => "true"
  subnet_id:                        "" => "<computed>"
  tags.%:                           "" => "1"
  tags.Name:                        "" => "tfworkshop-081e32339d72bf33"
  tenancy:                          "" => "<computed>"
  volume_tags.%:                    "" => "<computed>"
  vpc_security_group_ids.#:         "" => "1"
  vpc_security_group_ids.513362274: "" => "sg-8485f6fc"
aws_instance.instance: Still creating... (10s elapsed)
aws_instance.instance: Creation complete (ID: i-0f2e9fca0ce5d5424)

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path:

Outputs:

public_ip = 54.154.174.146
```

### Verify the resources in AWS Management console

1. Go to [Key pairs management console](https://eu-west-1.console.aws.amazon.com/ec2/v2/home?region=eu-west-1#KeyPairs:sort=keyName) and verify that your key pair has been created.
2. Go to [Instances management console](https://eu-west-1.console.aws.amazon.com/ec2/v2/home?region=eu-west-1#Instances:sort=desc:launchTime) and verify that your instance has been created.
3. Go to [Security groups management console](https://eu-west-1.console.aws.amazon.com/ec2/v2/home?region=eu-west-1#SecurityGroups:sort=tag:Name) and verify that your security group has been created.

### Try to SSH into the instance

```
$ ssh ubuntu@54.154.174.146
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-1028-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

0 packages can be updated.
0 updates are security updates.


Last login: Fri Aug 25 11:15:37 2017 from 85.193.224.48
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-31-21-85:~$
```

### Destroy the resources

```
$ terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_key_pair.workshop: Refreshing state... (ID: workshop_key)
aws_security_group.open: Refreshing state... (ID: sg-10e17068)
aws_instance.instance: Refreshing state... (ID: i-0eb72e198dfd8e421)
aws_key_pair.workshop: Destroying... (ID: workshop_key)
aws_instance.instance: Destroying... (ID: i-0eb72e198dfd8e421)
aws_key_pair.workshop: Destruction complete
aws_instance.instance: Still destroying... (ID: i-0eb72e198dfd8e421, 10s elapsed)
aws_instance.instance: Still destroying... (ID: i-0eb72e198dfd8e421, 20s elapsed)
aws_instance.instance: Still destroying... (ID: i-0eb72e198dfd8e421, 30s elapsed)
aws_instance.instance: Still destroying... (ID: i-0eb72e198dfd8e421, 40s elapsed)
aws_instance.instance: Still destroying... (ID: i-0eb72e198dfd8e421, 50s elapsed)
aws_instance.instance: Destruction complete
aws_security_group.open: Destroying... (ID: sg-10e17068)
aws_security_group.open: Destruction complete

Destroy complete! Resources: 3 destroyed.
```
