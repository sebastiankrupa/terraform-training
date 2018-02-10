# Modern Cloud Infrastructure with Terraform

## Creating your first EC2 instance

### Providing AWS credentials

In `main.tf` file, fill in `access_key` and `secret_key` parameters.

## Providing SSH public key

In `main.tf` file, fill in `public_key` parameter in `aws_key_pair.workshop` resource.

## Initializing Terraform

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

## Validate if the code is syntactically correct

```
$ terraform validate
Error loading files Error loading ../01_base/main.tf: position 9:10: resource must be followed by exactly two strings, a type and a name
```

Fix an error in `main.tf` file and run `terraform validate` again. If syntax is correct, no output will be given.

```
$ terraform validate
$
```


## Dry-run Terraform definition

```
$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed. Cyan entries are data sources to be read.

Note: You didn't specify an "-out" parameter to save this plan, so when
"apply" is called, Terraform can't guarantee this is what will execute.

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

+ random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"


Plan: 3 to add, 0 to change, 0 to destroy.
```

## Dry-run Terraform definition into plan file

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

+ random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"


Plan: 3 to add, 0 to change, 0 to destroy.
```

## Create your first AWS resources using Terraform

```
$ terraform apply terraform.plan
random_id.random: Creating...
  b64:         "" => "<computed>"
  b64_std:     "" => "<computed>"
  b64_url:     "" => "<computed>"
  byte_length: "" => "8"
  dec:         "" => "<computed>"
  hex:         "" => "<computed>"
random_id.random: Creation complete (ID: 1XZhg_jsmEM)
aws_key_pair.workshop: Creating...
  fingerprint: "" => "<computed>"
  key_name:    "" => "workshop_key-d5766183f8ec9843"
  public_key:  "" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8vL+aeWwmTVvcPt+uCzA7ydrrPAwy2LJ1v80iTJ1lmzT31h7hAcLf4gAT3sZzwC0qU+jCyllj252F3PJ2D19ol9LX5ObLuVxPbFzOaf0X2DE+GLb7tdIl+oQgcoKXfukZTK+rL79Z0YmfNdKgqURTn4vT1m41HsMsn57SOZ0dQlKIHI3z2fxZ7dZ7ft2pM4FgC4BbVAK3iekf3u4Fi8QdAcOCPd3AfpZstwfKCU5SOoY68HTvG8e/+eGKAhs25FLGZLv5SNJyuNJnZkoA54CWTc3zi+rvA5ZN2ivh1IgRfPKNnAo+5xyjerMJGvBCNUdBc7fYiMF+vwlnAeyk40qt kamsz@Kamils-MBP"
aws_instance.instance: Creating...
  ami:                          "" => "ami-da28dfa3"
  associate_public_ip_address:  "" => "<computed>"
  availability_zone:            "" => "<computed>"
  ebs_block_device.#:           "" => "<computed>"
  ephemeral_block_device.#:     "" => "<computed>"
  instance_state:               "" => "<computed>"
  instance_type:                "" => "t2.micro"
  ipv6_address_count:           "" => "<computed>"
  ipv6_addresses.#:             "" => "<computed>"
  key_name:                     "" => "workshop_key-d5766183f8ec9843"
  network_interface.#:          "" => "<computed>"
  network_interface_id:         "" => "<computed>"
  placement_group:              "" => "<computed>"
  primary_network_interface_id: "" => "<computed>"
  private_dns:                  "" => "<computed>"
  private_ip:                   "" => "<computed>"
  public_dns:                   "" => "<computed>"
  public_ip:                    "" => "<computed>"
  root_block_device.#:          "" => "<computed>"
  security_groups.#:            "" => "<computed>"
  source_dest_check:            "" => "true"
  subnet_id:                    "" => "<computed>"
  tags.%:                       "" => "1"
  tags.Name:                    "" => "tfworkshop-d5766183f8ec9843"
  tenancy:                      "" => "<computed>"
  volume_tags.%:                "" => "<computed>"
  vpc_security_group_ids.#:     "" => "<computed>"
aws_key_pair.workshop: Creation complete (ID: workshop_key-d5766183f8ec9843)
aws_instance.instance: Still creating... (10s elapsed)
aws_instance.instance: Creation complete (ID: i-0bb4ac3a233797d1e)

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path:

Outputs:

public_ip = 34.240.2.54
```

### Verify the resources in AWS Management console

1. Go to [Key pairs management console](https://eu-west-1.console.aws.amazon.com/ec2/v2/home?region=eu-west-1#KeyPairs:sort=keyName) and verify that your key pair has been created.
2. Go to [Instances management console](https://eu-west-1.console.aws.amazon.com/ec2/v2/home?region=eu-west-1#Instances:sort=desc:launchTime) and verify that your instance has been created.

## List outputs

```
$ terraform output
public_ip = 34.240.2.54
```

## Mark/unmark resource for recreation

```
$ terraform taint aws_instance.instance
The resource aws_instance.instance in the module root has been marked as tainted!
```

Now run `terraform plan -out terraform.plan` to see the changes.

```
$ terraform plan -out terraform.plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

random_id.random: Refreshing state... (ID: 1XZhg_jsmEM)
aws_instance.instance: Refreshing state... (ID: i-0bb4ac3a233797d1e)
aws_key_pair.workshop: Refreshing state... (ID: workshop_key-d5766183f8ec9843)
The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed. Cyan entries are data sources to be read.

Your plan was also saved to the path below. Call the "apply" subcommand
with this plan file and Terraform will exactly execute this execution
plan.

Path: terraform.plan

-/+ aws_instance.instance (tainted)
    ami:                          "ami-da28dfa3" => "ami-da28dfa3"
    associate_public_ip_address:  "true" => "<computed>"
    availability_zone:            "eu-west-1b" => "<computed>"
    ebs_block_device.#:           "0" => "<computed>"
    ephemeral_block_device.#:     "0" => "<computed>"
    instance_state:               "running" => "<computed>"
    instance_type:                "t2.micro" => "t2.micro"
    ipv6_address_count:           "" => "<computed>"
    ipv6_addresses.#:             "0" => "<computed>"
    key_name:                     "workshop_key-d5766183f8ec9843" => "workshop_key-d5766183f8ec9843"
    network_interface.#:          "0" => "<computed>"
    network_interface_id:         "eni-90a976af" => "<computed>"
    placement_group:              "" => "<computed>"
    primary_network_interface_id: "eni-90a976af" => "<computed>"
    private_dns:                  "ip-172-31-25-16.eu-west-1.compute.internal" => "<computed>"
    private_ip:                   "172.31.25.16" => "<computed>"
    public_dns:                   "ec2-34-240-2-54.eu-west-1.compute.amazonaws.com" => "<computed>"
    public_ip:                    "34.240.2.54" => "<computed>"
    root_block_device.#:          "1" => "<computed>"
    security_groups.#:            "0" => "<computed>"
    source_dest_check:            "true" => "true"
    subnet_id:                    "subnet-488c1501" => "<computed>"
    tags.%:                       "1" => "1"
    tags.Name:                    "tfworkshop-d5766183f8ec9843" => "tfworkshop-d5766183f8ec9843"
    tenancy:                      "default" => "<computed>"
    volume_tags.%:                "0" => "<computed>"
    vpc_security_group_ids.#:     "1" => "<computed>"


Plan: 1 to add, 0 to change, 1 to destroy.
```

Now untaint the resource.

```
$ terraform untaint aws_instance.instance
The resource aws_instance.instance in the module root has been successfully untainted!
```

See the changes using `terraform plan -out terraform.plan`.

```
$ terraform plan -out terraform.plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

random_id.random: Refreshing state... (ID: 1XZhg_jsmEM)
aws_instance.instance: Refreshing state... (ID: i-0bb4ac3a233797d1e)
aws_key_pair.workshop: Refreshing state... (ID: workshop_key-d5766183f8ec9843)
No changes. Infrastructure is up-to-date.

This means that Terraform did not detect any differences between your
configuration and real physical resources that exist. As a result, Terraform
doesn't need to do anything.
```

## Show details of resources inside of the state

```
$ terraform show
aws_instance.instance:
  id = i-0bb4ac3a233797d1e
  ami = ami-da28dfa3
  associate_public_ip_address = true
  availability_zone = eu-west-1b
  disable_api_termination = false
  ebs_block_device.# = 0
  ebs_optimized = false
  ephemeral_block_device.# = 0
  iam_instance_profile =
  instance_state = running
  instance_type = t2.micro
  ipv6_addresses.# = 0
  key_name = workshop_key-d5766183f8ec9843
  monitoring = false
  network_interface.# = 0
  network_interface_id = eni-90a976af
  primary_network_interface_id = eni-90a976af
  private_dns = ip-172-31-25-16.eu-west-1.compute.internal
  private_ip = 172.31.25.16
  public_dns = ec2-34-240-2-54.eu-west-1.compute.amazonaws.com
  public_ip = 34.240.2.54
  root_block_device.# = 1
  root_block_device.0.delete_on_termination = true
  root_block_device.0.iops = 100
  root_block_device.0.volume_size = 8
  root_block_device.0.volume_type = gp2
  security_groups.# = 0
  source_dest_check = true
  subnet_id = subnet-488c1501
  tags.% = 1
  tags.Name = tfworkshop-d5766183f8ec9843
  tenancy = default
  volume_tags.% = 0
  vpc_security_group_ids.# = 1
  vpc_security_group_ids.3703747165 = sg-434d3e3b
aws_key_pair.workshop:
  id = workshop_key-d5766183f8ec9843
  key_name = workshop_key-d5766183f8ec9843
  public_key = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8vL+aeWwmTVvcPt+uCzA7ydrrPAwy2LJ1v80iTJ1lmzT31h7hAcLf4gAT3sZzwC0qU+jCyllj252F3PJ2D19ol9LX5ObLuVxPbFzOaf0X2DE+GLb7tdIl+oQgcoKXfukZTK+rL79Z0YmfNdKgqURTn4vT1m41HsMsn57SOZ0dQlKIHI3z2fxZ7dZ7ft2pM4FgC4BbVAK3iekf3u4Fi8QdAcOCPd3AfpZstwfKCU5SOoY68HTvG8e/+eGKAhs25FLGZLv5SNJyuNJnZkoA54CWTc3zi+rvA5ZN2ivh1IgRfPKNnAo+5xyjerMJGvBCNUdBc7fYiMF+vwlnAeyk40qt kamsz@Kamils-MBP
random_id.random:
  id = 1XZhg_jsmEM
  b64 = 1XZhg_jsmEM
  b64_std = 1XZhg/jsmEM=
  b64_url = 1XZhg_jsmEM
  byte_length = 8
  dec = 15381588796775372867
  hex = d5766183f8ec9843


Outputs:

public_ip = 34.240.2.54
```

## Importing resources into state

At first, remove your state file.

```
$ rm -Rf terraform.tfstate*
```

Verify if Terraform state is lost:

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

+ random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"


Plan: 3 to add, 0 to change, 0 to destroy.
```

Import existing aws_key_pair and aws_instance into your new state.

```
$ terraform import aws_key_pair.workshop workshop_key-d5766183f8ec9843
aws_key_pair.workshop: Importing from ID "workshop_key-d5766183f8ec9843"...
aws_key_pair.workshop: Import complete!
  Imported aws_key_pair (ID: workshop_key-d5766183f8ec9843)
aws_key_pair.workshop: Refreshing state... (ID: workshop_key-d5766183f8ec9843)

Import success! The resources imported are shown above. These are
now in your Terraform state. Import does not currently generate
configuration, so you must do this next. If you do not create configuration
for the above resources, then the next `terraform plan` will mark
them for destruction.

$ terraform import aws_instance.instance i-0bb4ac3a233797d1e
aws_instance.instance: Importing from ID "i-0bb4ac3a233797d1e"...
aws_instance.instance: Import complete!
  Imported aws_instance (ID: i-0bb4ac3a233797d1e)
aws_instance.instance: Refreshing state... (ID: i-0bb4ac3a233797d1e)

Import success! The resources imported are shown above. These are
now in your Terraform state. Import does not currently generate
configuration, so you must do this next. If you do not create configuration
for the above resources, then the next `terraform plan` will mark
them for destruction.
```

Validate if resources were successfully imported:

```
$ terraform plan -out terraform.plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_instance.instance: Refreshing state... (ID: i-0bb4ac3a233797d1e)
aws_key_pair.workshop: Refreshing state... (ID: workshop_key-d5766183f8ec9843)
The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed. Cyan entries are data sources to be read.

Your plan was also saved to the path below. Call the "apply" subcommand
with this plan file and Terraform will exactly execute this execution
plan.

Path: terraform.plan

-/+ aws_instance.instance
    ami:                          "ami-da28dfa3" => "ami-da28dfa3"
    associate_public_ip_address:  "true" => "<computed>"
    availability_zone:            "eu-west-1b" => "<computed>"
    ebs_block_device.#:           "0" => "<computed>"
    ephemeral_block_device.#:     "0" => "<computed>"
    instance_state:               "running" => "<computed>"
    instance_type:                "t2.micro" => "t2.micro"
    ipv6_address_count:           "" => "<computed>"
    ipv6_addresses.#:             "0" => "<computed>"
    key_name:                     "workshop_key-d5766183f8ec9843" => "workshop_key-${random_id.random.hex}" (forces new resource)
    network_interface.#:          "0" => "<computed>"
    network_interface_id:         "eni-90a976af" => "<computed>"
    placement_group:              "" => "<computed>"
    primary_network_interface_id: "eni-90a976af" => "<computed>"
    private_dns:                  "ip-172-31-25-16.eu-west-1.compute.internal" => "<computed>"
    private_ip:                   "172.31.25.16" => "<computed>"
    public_dns:                   "ec2-34-240-2-54.eu-west-1.compute.amazonaws.com" => "<computed>"
    public_ip:                    "34.240.2.54" => "<computed>"
    root_block_device.#:          "1" => "<computed>"
    security_groups.#:            "0" => "<computed>"
    source_dest_check:            "true" => "true"
    subnet_id:                    "subnet-488c1501" => "<computed>"
    tags.%:                       "1" => "<computed>"
    tags.Name:                    "tfworkshop-d5766183f8ec9843" => ""
    tenancy:                      "default" => "<computed>"
    volume_tags.%:                "0" => "<computed>"
    vpc_security_group_ids.#:     "1" => "<computed>"

-/+ aws_key_pair.workshop
    fingerprint: "42:51:ca:51:6e:02:b9:d3:9f:13:d9:41:c0:c7:40:29" => "<computed>"
    key_name:    "workshop_key-d5766183f8ec9843" => "workshop_key-${random_id.random.hex}" (forces new resource)
    public_key:  "" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8vL+aeWwmTVvcPt+uCzA7ydrrPAwy2LJ1v80iTJ1lmzT31h7hAcLf4gAT3sZzwC0qU+jCyllj252F3PJ2D19ol9LX5ObLuVxPbFzOaf0X2DE+GLb7tdIl+oQgcoKXfukZTK+rL79Z0YmfNdKgqURTn4vT1m41HsMsn57SOZ0dQlKIHI3z2fxZ7dZ7ft2pM4FgC4BbVAK3iekf3u4Fi8QdAcOCPd3AfpZstwfKCU5SOoY68HTvG8e/+eGKAhs25FLGZLv5SNJyuNJnZkoA54CWTc3zi+rvA5ZN2ivh1IgRfPKNnAo+5xyjerMJGvBCNUdBc7fYiMF+vwlnAeyk40qt kamsz@Kamils-MBP" (forces new resource)

+ random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"


Plan: 4 to add, 0 to change, 2 to destroy.
```

### Destroy the resources

```
$ terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.instance: Refreshing state... (ID: i-0bb4ac3a233797d1e)
aws_key_pair.workshop: Refreshing state... (ID: workshop_key-d5766183f8ec9843)
aws_key_pair.workshop: Destroying... (ID: workshop_key-d5766183f8ec9843)
aws_instance.instance: Destroying... (ID: i-0bb4ac3a233797d1e)
aws_key_pair.workshop: Destruction complete
aws_instance.instance: Still destroying... (ID: i-0bb4ac3a233797d1e, 10s elapsed)
aws_instance.instance: Still destroying... (ID: i-0bb4ac3a233797d1e, 20s elapsed)
aws_instance.instance: Still destroying... (ID: i-0bb4ac3a233797d1e, 30s elapsed)
aws_instance.instance: Still destroying... (ID: i-0bb4ac3a233797d1e, 40s elapsed)
aws_instance.instance: Still destroying... (ID: i-0bb4ac3a233797d1e, 50s elapsed)
aws_instance.instance: Destruction complete

Destroy complete! Resources: 2 destroyed.
```
