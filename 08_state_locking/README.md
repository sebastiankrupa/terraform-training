# Modern Cloud Infrastructure with Terraform

## Working with Terraform state locking

### Creating S3 state bucket

Go to [DynamoDB management console](https://eu-west-1.console.aws.amazon.com/dynamodb/home?region=eu-west-1#gettingStarted:) and create DynamoDB table named `terraform-state-lock` and primary key named `LockID` of type string.

### Initializing Terraform

```
$ terraform init
Initializing the backend...


Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your environment. If you forget, other
commands will detect it and remind you to do so if necessary.
```

### Dry-run Terraform definition again

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

+ random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"


Plan: 3 to add, 0 to change, 0 to destroy.
Releasing state lock. This may take a few moments...
```

### Create the resources and interrupt the process in the middle

Type the below command and when it'll start creating resources hit CTRL+C several times to interrupt the process.
```
$ terraform apply terraform.plan
random_id.random: Creating...
  b64:         "" => "<computed>"
  b64_std:     "" => "<computed>"
  b64_url:     "" => "<computed>"
  byte_length: "" => "8"
  dec:         "" => "<computed>"
  hex:         "" => "<computed>"
random_id.random: Creation complete (ID: dtwULjxCL1s)
aws_key_pair.workshop: Creating...
  fingerprint: "" => "<computed>"
  key_name:    "" => "workshop_key-76dc142e3c422f5b"
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
  key_name:                     "" => "workshop_key-76dc142e3c422f5b"
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
  tags.Name:                    "" => "tfworkshop-76dc142e3c422f5b"
  tenancy:                      "" => "<computed>"
  volume_tags.%:                "" => "<computed>"
  vpc_security_group_ids.#:     "" => "<computed>"
aws_key_pair.workshop: Creation complete (ID: workshop_key-76dc142e3c422f5b)
^CInterrupt received.
Please wait for Terraform to exit or data loss may occur.
Gracefully shutting down...
stopping apply operation...
^CTwo interrupts received. Exiting immediately. Note that data
loss may have occurred.
```

### Try to create the resources again

```
$ terraform apply terraform.plan
Acquiring state lock. This may take a few moments...
Failed to load backend: Error locking state: Error acquiring the state lock: ConditionalCheckFailedException: The conditional request failed
        status code: 400, request id: PBMKD2GCEP98F7T2EE4VS3T1CVVV4KQNSO5AEMVJF66Q9ASUAAJG
Lock Info:
  ID:        360a6f27-e005-a0c1-3616-e539f4c3ec8f
  Path:      tfworkshop-myname-tfstate/terraform.tfstate
  Operation: OperationTypeApply
  Who:       kamsz@Kamils-MBP
  Version:   0.9.11
  Created:   2017-08-25 11:49:13.929659724 +0000 UTC
  Info:


Terraform acquires a state lock to protect the state from being written
by multiple users at the same time. Please resolve the issue above and try
again. For most commands, you can disable locking with the "-lock=false"
flag, but this is not recommended.
```

### Force unlock the state lock

```
$ terraform force-unlock 360a6f27-e005-a0c1-3616-e539f4c3ec8f
Do you really want to force-unlock?
  Terraform will remove the lock on the remote state.
  This will allow local Terraform commands to modify this state, even though it
  may be still be in use. Only 'yes' will be accepted to confirm.

  Enter a value: yes

Terraform state has been successfully unlocked!

The state has been unlocked, and Terraform commands should now be able to
obtain a new lock on the remote state.
```

### Create the resources

```
$ terraform apply terraform.plan
Releasing state lock. This may take a few moments...
Failed to load backend: This plan was created against an older state than is current. Please create
a new plan file against the latest state and try again.

Terraform doesn't allow you to run plans that were created from older
states since it doesn't properly represent the latest changes Terraform
may have made, and can result in unsafe behavior.

Plan Serial:    2
Current Serial: 3
```

### Dry-run Terraform definition

```
$ terraform plan -out terraform.plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

random_id.random: Refreshing state... (ID: dtwULjxCL1s)
aws_key_pair.workshop: Refreshing state... (ID: workshop_key-76dc142e3c422f5b)
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
    key_name:                     "workshop_key-76dc142e3c422f5b"
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
    tags.%:                       "1"
    tags.Name:                    "tfworkshop-76dc142e3c422f5b"
    tenancy:                      "<computed>"
    volume_tags.%:                "<computed>"
    vpc_security_group_ids.#:     "<computed>"


Plan: 2 to add, 0 to change, 0 to destroy.
```

### Create the resources

```
$ terraform apply terraform.plan
Acquiring state lock. This may take a few moments...
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
  key_name:                     "" => "workshop_key-76dc142e3c422f5b"
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
  tags.Name:                    "" => "tfworkshop-76dc142e3c422f5b"
  tenancy:                      "" => "<computed>"
  volume_tags.%:                "" => "<computed>"
  vpc_security_group_ids.#:     "" => "<computed>"
aws_instance.instance: Still creating... (10s elapsed)
aws_instance.instance: Still creating... (20s elapsed)
aws_instance.instance: Creation complete (ID: i-02eb77f978d433e57)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path:

Outputs:

public_ip = 34.253.196.62
```

### Destroy the resources

```
$ terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

random_id.random: Refreshing state... (ID: dtwULjxCL1s)
aws_instance.instance: Refreshing state... (ID: i-02eb77f978d433e57)
aws_key_pair.workshop: Refreshing state... (ID: workshop_key-76dc142e3c422f5b)
aws_key_pair.workshop: Destroying... (ID: workshop_key-76dc142e3c422f5b)
aws_instance.instance: Destroying... (ID: i-02eb77f978d433e57)
aws_key_pair.workshop: Destruction complete
aws_instance.instance: Still destroying... (ID: i-02eb77f978d433e57, 10s elapsed)
aws_instance.instance: Still destroying... (ID: i-02eb77f978d433e57, 20s elapsed)
aws_instance.instance: Still destroying... (ID: i-02eb77f978d433e57, 31s elapsed)
aws_instance.instance: Still destroying... (ID: i-02eb77f978d433e57, 41s elapsed)
aws_instance.instance: Still destroying... (ID: i-02eb77f978d433e57, 51s elapsed)
aws_instance.instance: Destruction complete
random_id.random: Destroying... (ID: dtwULjxCL1s)
random_id.random: Destruction complete

Destroy complete! Resources: 3 destroyed.
```
