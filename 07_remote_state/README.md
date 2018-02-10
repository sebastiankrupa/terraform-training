# Modern Cloud Infrastructure with Terraform

## Working with Terraform remote state

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

### Dry-run Terraform definition

```
$ terraform plan -out terraform.plan
Error loading state: NoSuchBucket: The specified bucket does not exist
        status code: 404, request id: 01B8041BE341B276, host id: 0sMg4PKbkVMFZtuArOaURE9dxgSyFC7j2SlN8+HT1spS1FpFbM3bmkuZVYNoeH9P/mIGYdAUJ98=
```

### Creating S3 state bucket

Go to [S3 management console](https://s3.console.aws.amazon.com/s3/home?region=eu-west-1) and create S3 bucket that will hold Terraform state e.g. `tfworkshop-myname-tfstate` and put it's name in `main.tf`. S3 bucket name must be unique across all S3 buckets within AWS.

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
random_id.random: Creation complete (ID: 3qd0qbMSTgo)
aws_key_pair.workshop: Creating...
  fingerprint: "" => "<computed>"
  key_name:    "" => "workshop_key-dea774a9b3124e0a"
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
  key_name:                     "" => "workshop_key-dea774a9b3124e0a"
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
  tags.Name:                    "" => "tfworkshop-dea774a9b3124e0a"
  tenancy:                      "" => "<computed>"
  volume_tags.%:                "" => "<computed>"
  vpc_security_group_ids.#:     "" => "<computed>"
aws_key_pair.workshop: Creation complete (ID: workshop_key-dea774a9b3124e0a)
aws_instance.instance: Still creating... (10s elapsed)
aws_instance.instance: Still creating... (20s elapsed)
aws_instance.instance: Creation complete (ID: i-02da2e38c314093de)

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path:

Outputs:

public_ip = 34.253.186.166
```

### Verify Terraform remote state

1. Go to [S3 management console](https://s3.console.aws.amazon.com/s3/home?region=eu-west-1)
2. Enter your Terraform state S3 bucket
3. Download `terraform.tfstate` file
4. Look inside :)
5. File should look similar to output below:

```
{
    "version": 3,
    "terraform_version": "0.9.11",
    "serial": 1,
    "lineage": "b440df33-fb8e-4818-a036-f130a7418ee5",
    "modules": [
        {
            "path": [
                "root"
            ],
            "outputs": {
                "public_ip": {
                    "sensitive": false,
                    "type": "string",
                    "value": "34.253.186.166"
                }
            },
            "resources": {
                "aws_instance.instance": {
                    "type": "aws_instance",
                    "depends_on": [
                        "random_id.random"
                    ],
                    "primary": {
                        "id": "i-02da2e38c314093de",
                        "attributes": {
                            "ami": "ami-da28dfa3",
                            "associate_public_ip_address": "true",
                            "availability_zone": "eu-west-1b",
                            "disable_api_termination": "false",
                            "ebs_block_device.#": "0",
                            "ebs_optimized": "false",
                            "ephemeral_block_device.#": "0",
                            "iam_instance_profile": "",
                            "id": "i-02da2e38c314093de",
                            "instance_state": "running",
                            "instance_type": "t2.micro",
                            "ipv6_addresses.#": "0",
                            "key_name": "workshop_key-dea774a9b3124e0a",
                            "monitoring": "false",
                            "network_interface.#": "0",
                            "network_interface_id": "eni-1bff2024",
                            "primary_network_interface_id": "eni-1bff2024",
                            "private_dns": "ip-172-31-28-214.eu-west-1.compute.internal",
                            "private_ip": "172.31.28.214",
                            "public_dns": "ec2-34-253-186-166.eu-west-1.compute.amazonaws.com",
                            "public_ip": "34.253.186.166",
                            "root_block_device.#": "1",
                            "root_block_device.0.delete_on_termination": "true",
                            "root_block_device.0.iops": "100",
                            "root_block_device.0.volume_size": "8",
                            "root_block_device.0.volume_type": "gp2",
                            "security_groups.#": "0",
                            "source_dest_check": "true",
                            "subnet_id": "subnet-488c1501",
                            "tags.%": "1",
                            "tags.Name": "tfworkshop-dea774a9b3124e0a",
                            "tenancy": "default",
                            "volume_tags.%": "0",
                            "vpc_security_group_ids.#": "1",
                            "vpc_security_group_ids.3703747165": "sg-434d3e3b"
                        },
                        "meta": {
                            "e2bfb730-ecaa-11e6-8f88-34363bc7c4c0": {
                                "create": 600000000000,
                                "delete": 600000000000,
                                "update": 600000000000
                            },
                            "schema_version": "1"
                        },
                        "tainted": false
                    },
                    "deposed": [],
                    "provider": ""
                },
                "aws_key_pair.workshop": {
                    "type": "aws_key_pair",
                    "depends_on": [
                        "random_id.random"
                    ],
                    "primary": {
                        "id": "workshop_key-dea774a9b3124e0a",
                        "attributes": {
                            "id": "workshop_key-dea774a9b3124e0a",
                            "key_name": "workshop_key-dea774a9b3124e0a",
                            "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8vL+aeWwmTVvcPt+uCzA7ydrrPAwy2LJ1v80iTJ1lmzT31h7hAcLf4gAT3sZzwC0qU+jCyllj252F3PJ2D19ol9LX5ObLuVxPbFzOaf0X2DE+GLb7tdIl+oQgcoKXfukZTK+rL79Z0YmfNdKgqURTn4vT1m41HsMsn57SOZ0dQlKIHI3z2fxZ7dZ7ft2pM4FgC4BbVAK3iekf3u4Fi8QdAcOCPd3AfpZstwfKCU5SOoY68HTvG8e/+eGKAhs25FLGZLv5SNJyuNJnZkoA54CWTc3zi+rvA5ZN2ivh1IgRfPKNnAo+5xyjerMJGvBCNUdBc7fYiMF+vwlnAeyk40qt kamsz@Kamils-MBP"
                        },
                        "meta": {
                            "schema_version": "1"
                        },
                        "tainted": false
                    },
                    "deposed": [],
                    "provider": ""
                },
                "random_id.random": {
                    "type": "random_id",
                    "depends_on": [],
                    "primary": {
                        "id": "3qd0qbMSTgo",
                        "attributes": {
                            "b64": "3qd0qbMSTgo",
                            "b64_std": "3qd0qbMSTgo=",
                            "b64_url": "3qd0qbMSTgo",
                            "byte_length": "8",
                            "dec": "16043920469733297674",
                            "hex": "dea774a9b3124e0a",
                            "id": "3qd0qbMSTgo"
                        },
                        "meta": {},
                        "tainted": false
                    },
                    "deposed": [],
                    "provider": ""
                }
            },
            "depends_on": []
        }
    ]
}
```

### Remove all Terraform configuration files

```
$ rm -Rf terraform.tfstate.backup .terraform
$
```

### Try to dry-run Terraform definition

```
$ terraform plan -out terraform.plan
Backend reinitialization required. Please run "terraform init".
Reason: Initial configuration of the requested backend "s3"

The "backend" is the interface that Terraform uses to store state,
perform operations, etc. If this message is showing up, it means that the
Terraform configuration you're using is using a custom configuration for
the Terraform backend.

Changes to backend configurations require reinitialization. This allows
Terraform to setup the new configuration, copy existing state, etc. This is
only done during "terraform init". Please run that command now then try again.

If the change reason above is incorrect, please verify your configuration
hasn't changed and try again. At this point, no changes to your existing
configuration or state have been made.

Failed to load backend: Initialization required. Please see the error message above.
```

### Initialize Terraform again

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

### Try to dry-run Terraform definition

```
$ terraform plan -out terraform.plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

random_id.random: Refreshing state... (ID: 3qd0qbMSTgo)
aws_key_pair.workshop: Refreshing state... (ID: workshop_key-dea774a9b3124e0a)
aws_instance.instance: Refreshing state... (ID: i-02da2e38c314093de)
No changes. Infrastructure is up-to-date.

This means that Terraform did not detect any differences between your
configuration and real physical resources that exist. As a result, Terraform
doesn't need to do anything.
```

### Destroy the resources

```
$ terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

random_id.random: Refreshing state... (ID: 3qd0qbMSTgo)
aws_key_pair.workshop: Refreshing state... (ID: workshop_key-dea774a9b3124e0a)
aws_instance.instance: Refreshing state... (ID: i-02da2e38c314093de)
aws_key_pair.workshop: Destroying... (ID: workshop_key-dea774a9b3124e0a)
aws_instance.instance: Destroying... (ID: i-02da2e38c314093de)
aws_key_pair.workshop: Destruction complete
aws_instance.instance: Still destroying... (ID: i-02da2e38c314093de, 10s elapsed)
aws_instance.instance: Still destroying... (ID: i-02da2e38c314093de, 20s elapsed)
aws_instance.instance: Still destroying... (ID: i-02da2e38c314093de, 30s elapsed)
aws_instance.instance: Still destroying... (ID: i-02da2e38c314093de, 40s elapsed)
aws_instance.instance: Still destroying... (ID: i-02da2e38c314093de, 50s elapsed)
aws_instance.instance: Destruction complete
random_id.random: Destroying... (ID: 3qd0qbMSTgo)
random_id.random: Destruction complete

Destroy complete! Resources: 3 destroyed.
```
