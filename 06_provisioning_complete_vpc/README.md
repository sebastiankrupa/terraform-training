# Modern Cloud Infrastructure with Terraform

## Provisioning a complete VPC

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

+ aws_eip.eip.0
    allocation_id:     "<computed>"
    association_id:    "<computed>"
    domain:            "<computed>"
    instance:          "<computed>"
    network_interface: "<computed>"
    private_ip:        "<computed>"
    public_ip:         "<computed>"
    vpc:               "<computed>"

+ aws_eip.eip.1
    allocation_id:     "<computed>"
    association_id:    "<computed>"
    domain:            "<computed>"
    instance:          "<computed>"
    network_interface: "<computed>"
    private_ip:        "<computed>"
    public_ip:         "<computed>"
    vpc:               "<computed>"

+ aws_eip.eip.2
    allocation_id:     "<computed>"
    association_id:    "<computed>"
    domain:            "<computed>"
    instance:          "<computed>"
    network_interface: "<computed>"
    private_ip:        "<computed>"
    public_ip:         "<computed>"
    vpc:               "<computed>"

+ aws_internet_gateway.igw
    tags.%: "<computed>"
    vpc_id: "${aws_vpc.vpc.id}"

+ aws_nat_gateway.nat.0
    allocation_id:        "${element(aws_eip.eip.*.id, count.index)}"
    network_interface_id: "<computed>"
    private_ip:           "<computed>"
    public_ip:            "<computed>"
    subnet_id:            "${element(aws_subnet.subnet.*.id, count.index)}"

+ aws_nat_gateway.nat.1
    allocation_id:        "${element(aws_eip.eip.*.id, count.index)}"
    network_interface_id: "<computed>"
    private_ip:           "<computed>"
    public_ip:            "<computed>"
    subnet_id:            "${element(aws_subnet.subnet.*.id, count.index)}"

+ aws_nat_gateway.nat.2
    allocation_id:        "${element(aws_eip.eip.*.id, count.index)}"
    network_interface_id: "<computed>"
    private_ip:           "<computed>"
    public_ip:            "<computed>"
    subnet_id:            "${element(aws_subnet.subnet.*.id, count.index)}"

+ aws_route.default.0
    destination_cidr_block:     "0.0.0.0/0"
    destination_prefix_list_id: "<computed>"
    egress_only_gateway_id:     "<computed>"
    gateway_id:                 "${aws_internet_gateway.igw.id}"
    instance_id:                "<computed>"
    instance_owner_id:          "<computed>"
    nat_gateway_id:             "<computed>"
    network_interface_id:       "<computed>"
    origin:                     "<computed>"
    route_table_id:             "${element(aws_route_table.route_table.*.id, count.index)}"
    state:                      "<computed>"

+ aws_route.default.1
    destination_cidr_block:     "0.0.0.0/0"
    destination_prefix_list_id: "<computed>"
    egress_only_gateway_id:     "<computed>"
    gateway_id:                 "${aws_internet_gateway.igw.id}"
    instance_id:                "<computed>"
    instance_owner_id:          "<computed>"
    nat_gateway_id:             "<computed>"
    network_interface_id:       "<computed>"
    origin:                     "<computed>"
    route_table_id:             "${element(aws_route_table.route_table.*.id, count.index)}"
    state:                      "<computed>"

+ aws_route.default.2
    destination_cidr_block:     "0.0.0.0/0"
    destination_prefix_list_id: "<computed>"
    egress_only_gateway_id:     "<computed>"
    gateway_id:                 "${aws_internet_gateway.igw.id}"
    instance_id:                "<computed>"
    instance_owner_id:          "<computed>"
    nat_gateway_id:             "<computed>"
    network_interface_id:       "<computed>"
    origin:                     "<computed>"
    route_table_id:             "${element(aws_route_table.route_table.*.id, count.index)}"
    state:                      "<computed>"

+ aws_route_table.route_table.0
    route.#: "<computed>"
    tags.%:  "<computed>"
    vpc_id:  "${aws_vpc.vpc.id}"

+ aws_route_table.route_table.1
    route.#: "<computed>"
    tags.%:  "<computed>"
    vpc_id:  "${aws_vpc.vpc.id}"

+ aws_route_table.route_table.2
    route.#: "<computed>"
    tags.%:  "<computed>"
    vpc_id:  "${aws_vpc.vpc.id}"

+ aws_route_table_association.route_table_association.0
    route_table_id: "${element(aws_route_table.route_table.*.id, count.index)}"
    subnet_id:      "${element(aws_subnet.subnet.*.id, count.index)}"

+ aws_route_table_association.route_table_association.1
    route_table_id: "${element(aws_route_table.route_table.*.id, count.index)}"
    subnet_id:      "${element(aws_subnet.subnet.*.id, count.index)}"

+ aws_route_table_association.route_table_association.2
    route_table_id: "${element(aws_route_table.route_table.*.id, count.index)}"
    subnet_id:      "${element(aws_subnet.subnet.*.id, count.index)}"

+ aws_subnet.subnet.0
    assign_ipv6_address_on_creation: "false"
    availability_zone:               "eu-west-1a"
    cidr_block:                      "172.99.0.0/26"
    ipv6_cidr_block:                 "<computed>"
    ipv6_cidr_block_association_id:  "<computed>"
    map_public_ip_on_launch:         "false"
    tags.%:                          "<computed>"
    vpc_id:                          "${aws_vpc.vpc.id}"

+ aws_subnet.subnet.1
    assign_ipv6_address_on_creation: "false"
    availability_zone:               "eu-west-1b"
    cidr_block:                      "172.99.0.64/26"
    ipv6_cidr_block:                 "<computed>"
    ipv6_cidr_block_association_id:  "<computed>"
    map_public_ip_on_launch:         "false"
    tags.%:                          "<computed>"
    vpc_id:                          "${aws_vpc.vpc.id}"

+ aws_subnet.subnet.2
    assign_ipv6_address_on_creation: "false"
    availability_zone:               "eu-west-1c"
    cidr_block:                      "172.99.0.128/26"
    ipv6_cidr_block:                 "<computed>"
    ipv6_cidr_block_association_id:  "<computed>"
    map_public_ip_on_launch:         "false"
    tags.%:                          "<computed>"
    vpc_id:                          "${aws_vpc.vpc.id}"

+ aws_vpc.vpc
    assign_generated_ipv6_cidr_block: "false"
    cidr_block:                       "172.99.0.0/16"
    default_network_acl_id:           "<computed>"
    default_route_table_id:           "<computed>"
    default_security_group_id:        "<computed>"
    dhcp_options_id:                  "<computed>"
    enable_classiclink:               "<computed>"
    enable_dns_hostnames:             "true"
    enable_dns_support:               "true"
    instance_tenancy:                 "<computed>"
    ipv6_association_id:              "<computed>"
    ipv6_cidr_block:                  "<computed>"
    main_route_table_id:              "<computed>"
    tags.%:                           "<computed>"

+ random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"


Plan: 21 to add, 0 to change, 0 to destroy.
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
random_id.random: Creation complete (ID: QiB8CZq_ghs)
aws_eip.eip.1: Creating...
  allocation_id:     "" => "<computed>"
  association_id:    "" => "<computed>"
  domain:            "" => "<computed>"
  instance:          "" => "<computed>"
  network_interface: "" => "<computed>"
  private_ip:        "" => "<computed>"
  public_ip:         "" => "<computed>"
  vpc:               "" => "<computed>"
aws_eip.eip.0: Creating...
  allocation_id:     "" => "<computed>"
  association_id:    "" => "<computed>"
  domain:            "" => "<computed>"
  instance:          "" => "<computed>"
  network_interface: "" => "<computed>"
  private_ip:        "" => "<computed>"
  public_ip:         "" => "<computed>"
  vpc:               "" => "<computed>"
aws_eip.eip.2: Creating...
  allocation_id:     "" => "<computed>"
  association_id:    "" => "<computed>"
  domain:            "" => "<computed>"
  instance:          "" => "<computed>"
  network_interface: "" => "<computed>"
  private_ip:        "" => "<computed>"
  public_ip:         "" => "<computed>"
  vpc:               "" => "<computed>"
aws_vpc.vpc: Creating...
  assign_generated_ipv6_cidr_block: "" => "false"
  cidr_block:                       "" => "172.99.0.0/16"
  default_network_acl_id:           "" => "<computed>"
  default_route_table_id:           "" => "<computed>"
  default_security_group_id:        "" => "<computed>"
  dhcp_options_id:                  "" => "<computed>"
  enable_classiclink:               "" => "<computed>"
  enable_dns_hostnames:             "" => "true"
  enable_dns_support:               "" => "true"
  instance_tenancy:                 "" => "<computed>"
  ipv6_association_id:              "" => "<computed>"
  ipv6_cidr_block:                  "" => "<computed>"
  main_route_table_id:              "" => "<computed>"
  tags.%:                           "" => "1"
  tags.Name:                        "" => "tfworkshop-42207c099abf821b"
aws_eip.eip.0: Creation complete (ID: eipalloc-ba5c7a80)
aws_eip.eip.1: Creation complete (ID: eipalloc-875f79bd)
aws_eip.eip.2: Creation complete (ID: eipalloc-235c7a19)
aws_vpc.vpc: Creation complete (ID: vpc-d6fa63b1)
aws_internet_gateway.igw: Creating...
  tags.%:           "0" => "2"
  tags.Environment: "" => "tfworkshop"
  tags.Name:        "" => "igw-tfworkshop-42207c099abf821b"
  vpc_id:           "" => "vpc-d6fa63b1"
aws_route_table.route_table.0: Creating...
  route.#:          "" => "<computed>"
  tags.%:           "" => "2"
  tags.Environment: "" => "tfworkshop"
  tags.Name:        "" => "nat-eu-west-1a-tfworkshop-42207c099abf821b"
  vpc_id:           "" => "vpc-d6fa63b1"
aws_route_table.route_table.1: Creating...
  route.#:          "" => "<computed>"
  tags.%:           "" => "2"
  tags.Environment: "" => "tfworkshop"
  tags.Name:        "" => "nat-eu-west-1b-tfworkshop-42207c099abf821b"
  vpc_id:           "" => "vpc-d6fa63b1"
aws_subnet.subnet.2: Creating...
  assign_ipv6_address_on_creation: "" => "false"
  availability_zone:               "" => "eu-west-1c"
  cidr_block:                      "" => "172.99.0.128/26"
  ipv6_cidr_block:                 "" => "<computed>"
  ipv6_cidr_block_association_id:  "" => "<computed>"
  map_public_ip_on_launch:         "" => "false"
  tags.%:                          "" => "2"
  tags.Environment:                "" => "tfworkshop"
  tags.Name:                       "" => "nat-eu-west-1c-tfworkshop-42207c099abf821b"
  vpc_id:                          "" => "vpc-d6fa63b1"
aws_route_table.route_table.2: Creating...
  route.#:          "" => "<computed>"
  tags.%:           "" => "2"
  tags.Environment: "" => "tfworkshop"
  tags.Name:        "" => "nat-eu-west-1c-tfworkshop-42207c099abf821b"
  vpc_id:           "" => "vpc-d6fa63b1"
aws_subnet.subnet.1: Creating...
  assign_ipv6_address_on_creation: "" => "false"
  availability_zone:               "" => "eu-west-1b"
  cidr_block:                      "" => "172.99.0.64/26"
  ipv6_cidr_block:                 "" => "<computed>"
  ipv6_cidr_block_association_id:  "" => "<computed>"
    map_public_ip_on_launch:         "" => "false"
  tags.%:                          "" => "2"
  tags.Environment:                "" => "tfworkshop"
  tags.Name:                       "" => "nat-eu-west-1b-tfworkshop-42207c099abf821b"
  vpc_id:                          "" => "vpc-d6fa63b1"
aws_subnet.subnet.0: Creating...
  assign_ipv6_address_on_creation: "" => "false"
  availability_zone:               "" => "eu-west-1a"
  cidr_block:                      "" => "172.99.0.0/26"
  ipv6_cidr_block:                 "" => "<computed>"
  ipv6_cidr_block_association_id:  "" => "<computed>"
  map_public_ip_on_launch:         "" => "false"
  tags.%:                          "" => "2"
  tags.Environment:                "" => "tfworkshop"
  tags.Name:                       "" => "nat-eu-west-1a-tfworkshop-42207c099abf821b"
  vpc_id:                          "" => "vpc-d6fa63b1"
aws_route_table.route_table.1: Creation complete (ID: rtb-b15693d7)
aws_route_table.route_table.0: Creation complete (ID: rtb-004a8f66)
aws_route_table.route_table.2: Creation complete (ID: rtb-5c51943a)
aws_internet_gateway.igw: Creation complete (ID: igw-aed4e3ca)
aws_route.default.0: Creating...
  destination_cidr_block:     "" => "0.0.0.0/0"
  destination_prefix_list_id: "" => "<computed>"
  egress_only_gateway_id:     "" => "<computed>"
  gateway_id:                 "" => "igw-aed4e3ca"
  instance_id:                "" => "<computed>"
  instance_owner_id:          "" => "<computed>"
  nat_gateway_id:             "" => "<computed>"
  network_interface_id:       "" => "<computed>"
  origin:                     "" => "<computed>"
  route_table_id:             "" => "rtb-004a8f66"
  state:                      "" => "<computed>"
aws_route.default.1: Creating...
  destination_cidr_block:     "" => "0.0.0.0/0"
  destination_prefix_list_id: "" => "<computed>"
  egress_only_gateway_id:     "" => "<computed>"
  gateway_id:                 "" => "igw-aed4e3ca"
  instance_id:                "" => "<computed>"
  instance_owner_id:          "" => "<computed>"
  nat_gateway_id:             "" => "<computed>"
  network_interface_id:       "" => "<computed>"
  origin:                     "" => "<computed>"
  route_table_id:             "" => "rtb-b15693d7"
  state:                      "" => "<computed>"
aws_route.default.2: Creating...
  destination_cidr_block:     "" => "0.0.0.0/0"
  destination_prefix_list_id: "" => "<computed>"
  egress_only_gateway_id:     "" => "<computed>"
  gateway_id:                 "" => "igw-aed4e3ca"
  instance_id:                "" => "<computed>"
  instance_owner_id:          "" => "<computed>"
  nat_gateway_id:             "" => "<computed>"
  network_interface_id:       "" => "<computed>"
  origin:                     "" => "<computed>"
  route_table_id:             "" => "rtb-5c51943a"
  state:                      "" => "<computed>"
aws_subnet.subnet.0: Creation complete (ID: subnet-828415e5)
aws_subnet.subnet.1: Creation complete (ID: subnet-93ac35da)
aws_subnet.subnet.2: Creation complete (ID: subnet-2cb26f77)
aws_route_table_association.route_table_association.0: Creating...
  route_table_id: "" => "rtb-004a8f66"
  subnet_id:      "" => "subnet-828415e5"
aws_nat_gateway.nat.0: Creating...
  allocation_id:        "" => "eipalloc-ba5c7a80"
  network_interface_id: "" => "<computed>"
  private_ip:           "" => "<computed>"
  public_ip:            "" => "<computed>"
  subnet_id:            "" => "subnet-828415e5"
aws_route_table_association.route_table_association.1: Creating...
  route_table_id: "" => "rtb-b15693d7"
  subnet_id:      "" => "subnet-93ac35da"
aws_nat_gateway.nat.1: Creating...
  allocation_id:        "" => "eipalloc-875f79bd"
  network_interface_id: "" => "<computed>"
  private_ip:           "" => "<computed>"
  public_ip:            "" => "<computed>"
  subnet_id:            "" => "subnet-93ac35da"
aws_route_table_association.route_table_association.2: Creating...
  route_table_id: "" => "rtb-5c51943a"
  subnet_id:      "" => "subnet-2cb26f77"
aws_nat_gateway.nat.2: Creating...
  allocation_id:        "" => "eipalloc-235c7a19"
  network_interface_id: "" => "<computed>"
  private_ip:           "" => "<computed>"
  public_ip:            "" => "<computed>"
  subnet_id:            "" => "subnet-2cb26f77"
aws_route_table_association.route_table_association.2: Creation complete (ID: rtbassoc-df49b2a6)
aws_route_table_association.route_table_association.1: Creation complete (ID: rtbassoc-7348b30a)
aws_route_table_association.route_table_association.0: Creation complete (ID: rtbassoc-f24cb78b)
aws_route.default.2: Creation complete (ID: r-rtb-5c51943a1080289494)
aws_route.default.1: Creation complete (ID: r-rtb-b15693d71080289494)
aws_route.default.0: Creation complete (ID: r-rtb-004a8f661080289494)
aws_nat_gateway.nat.0: Still creating... (10s elapsed)
aws_nat_gateway.nat.1: Still creating... (10s elapsed)
aws_nat_gateway.nat.2: Still creating... (10s elapsed)
aws_nat_gateway.nat.1: Still creating... (20s elapsed)
aws_nat_gateway.nat.0: Still creating... (20s elapsed)
aws_nat_gateway.nat.2: Still creating... (20s elapsed)
aws_nat_gateway.nat.1: Still creating... (30s elapsed)
aws_nat_gateway.nat.0: Still creating... (30s elapsed)
aws_nat_gateway.nat.2: Still creating... (30s elapsed)
aws_nat_gateway.nat.2: Still creating... (40s elapsed)
aws_nat_gateway.nat.0: Still creating... (40s elapsed)
aws_nat_gateway.nat.1: Still creating... (40s elapsed)
aws_nat_gateway.nat.2: Still creating... (50s elapsed)
aws_nat_gateway.nat.0: Still creating... (50s elapsed)
aws_nat_gateway.nat.1: Still creating... (50s elapsed)
aws_nat_gateway.nat.0: Still creating... (1m0s elapsed)
aws_nat_gateway.nat.1: Still creating... (1m0s elapsed)
aws_nat_gateway.nat.2: Still creating... (1m0s elapsed)
aws_nat_gateway.nat.2: Still creating... (1m10s elapsed)
aws_nat_gateway.nat.0: Still creating... (1m10s elapsed)
aws_nat_gateway.nat.1: Still creating... (1m10s elapsed)
aws_nat_gateway.nat.1: Still creating... (1m20s elapsed)
aws_nat_gateway.nat.0: Still creating... (1m20s elapsed)
aws_nat_gateway.nat.2: Still creating... (1m20s elapsed)
aws_nat_gateway.nat.1: Still creating... (1m30s elapsed)
aws_nat_gateway.nat.0: Still creating... (1m30s elapsed)
aws_nat_gateway.nat.2: Still creating... (1m30s elapsed)
aws_nat_gateway.nat.1: Still creating... (1m40s elapsed)
aws_nat_gateway.nat.0: Still creating... (1m40s elapsed)
aws_nat_gateway.nat.2: Still creating... (1m40s elapsed)
aws_nat_gateway.nat.1: Creation complete (ID: nat-0394db939a79c3c36)
aws_nat_gateway.nat.0: Still creating... (1m50s elapsed)
aws_nat_gateway.nat.2: Still creating... (1m50s elapsed)
aws_nat_gateway.nat.2: Creation complete (ID: nat-0c4e6ca95c9386e7c)
aws_nat_gateway.nat.0: Still creating... (2m0s elapsed)
aws_nat_gateway.nat.0: Still creating... (2m10s elapsed)
aws_nat_gateway.nat.0: Still creating... (2m20s elapsed)
aws_nat_gateway.nat.0: Creation complete (ID: nat-000f11e6e84a954b5)

Apply complete! Resources: 21 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path:
```

### Verify the resources in AWS Management console

1. Go to [VPCs management console](https://eu-west-1.console.aws.amazon.com/vpc/home?region=eu-west-1#vpcs:) and verify that your VPC have been created.
2. Go to [Subnets management console](https://eu-west-1.console.aws.amazon.com/vpc/home?region=eu-west-1#subnets:filter=nat) and verify that your NAT subnets have been created.
3. Go to [Route tables management console](https://eu-west-1.console.aws.amazon.com/vpc/home?region=eu-west-1#routetables:filter=nat) and verify that your NAT route tables have been created.
4. Go to [Internet gateways management console](https://eu-west-1.console.aws.amazon.com/vpc/home?region=eu-west-1#igws:) and verify that your internet gateway has been created.
5. Go to [Elastic IPs management console](https://eu-west-1.console.aws.amazon.com/vpc/home?region=eu-west-1#Addresses:) and verify that 3 Elastic IPs have been allocated.
6. Go to [NAT gateways management console](https://eu-west-1.console.aws.amazon.com/vpc/home?region=eu-west-1#NatGateways:sort=desc:createTime) and verify that your NAT gateways have been created.

### Destroy the resources

```
$ terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

random_id.random: Refreshing state... (ID: QiB8CZq_ghs)
aws_vpc.vpc: Refreshing state... (ID: vpc-d6fa63b1)
aws_eip.eip.1: Refreshing state... (ID: eipalloc-875f79bd)
aws_eip.eip.2: Refreshing state... (ID: eipalloc-235c7a19)
aws_eip.eip.0: Refreshing state... (ID: eipalloc-ba5c7a80)
aws_internet_gateway.igw: Refreshing state... (ID: igw-aed4e3ca)
aws_route_table.route_table.2: Refreshing state... (ID: rtb-5c51943a)
aws_route_table.route_table.1: Refreshing state... (ID: rtb-b15693d7)
aws_route_table.route_table.0: Refreshing state... (ID: rtb-004a8f66)
aws_subnet.subnet.1: Refreshing state... (ID: subnet-93ac35da)
aws_subnet.subnet.0: Refreshing state... (ID: subnet-828415e5)
aws_subnet.subnet.2: Refreshing state... (ID: subnet-2cb26f77)
aws_route.default.2: Refreshing state... (ID: r-rtb-5c51943a1080289494)
aws_route.default.1: Refreshing state... (ID: r-rtb-b15693d71080289494)
aws_route.default.0: Refreshing state... (ID: r-rtb-004a8f661080289494)
aws_nat_gateway.nat.0: Refreshing state... (ID: nat-000f11e6e84a954b5)
aws_nat_gateway.nat.1: Refreshing state... (ID: nat-0394db939a79c3c36)
aws_nat_gateway.nat.2: Refreshing state... (ID: nat-0c4e6ca95c9386e7c)
aws_route_table_association.route_table_association.2: Refreshing state... (ID: rtbassoc-df49b2a6)
aws_route_table_association.route_table_association.0: Refreshing state... (ID: rtbassoc-f24cb78b)
aws_route_table_association.route_table_association.1: Refreshing state... (ID: rtbassoc-7348b30a)
aws_nat_gateway.nat.0: Destroying... (ID: nat-000f11e6e84a954b5)
aws_nat_gateway.nat.1: Destroying... (ID: nat-0394db939a79c3c36)
aws_route.default.2: Destroying... (ID: r-rtb-5c51943a1080289494)
aws_route.default.1: Destroying... (ID: r-rtb-b15693d71080289494)
aws_route_table_association.route_table_association.0: Destroying... (ID: rtbassoc-f24cb78b)
aws_route_table_association.route_table_association.2: Destroying... (ID: rtbassoc-df49b2a6)
aws_route.default.0: Destroying... (ID: r-rtb-004a8f661080289494)
aws_route_table_association.route_table_association.1: Destroying... (ID: rtbassoc-7348b30a)
aws_nat_gateway.nat.2: Destroying... (ID: nat-0c4e6ca95c9386e7c)
aws_route.default.2: Destruction complete
aws_route.default.0: Destruction complete
aws_route_table_association.route_table_association.0: Destruction complete
aws_route_table_association.route_table_association.2: Destruction complete
aws_route_table_association.route_table_association.1: Destruction complete
aws_route.default.1: Destruction complete
aws_route_table.route_table.2: Destroying... (ID: rtb-5c51943a)
aws_internet_gateway.igw: Destroying... (ID: igw-aed4e3ca)
aws_route_table.route_table.1: Destroying... (ID: rtb-b15693d7)
aws_route_table.route_table.0: Destroying... (ID: rtb-004a8f66)
aws_route_table.route_table.0: Destruction complete
aws_route_table.route_table.2: Destruction complete
aws_route_table.route_table.1: Destruction complete
aws_nat_gateway.nat.0: Still destroying... (ID: nat-000f11e6e84a954b5, 10s elapsed)
aws_nat_gateway.nat.1: Still destroying... (ID: nat-0394db939a79c3c36, 10s elapsed)
aws_nat_gateway.nat.2: Still destroying... (ID: nat-0c4e6ca95c9386e7c, 10s elapsed)
aws_internet_gateway.igw: Still destroying... (ID: igw-aed4e3ca, 10s elapsed)
aws_nat_gateway.nat.0: Still destroying... (ID: nat-000f11e6e84a954b5, 20s elapsed)
aws_nat_gateway.nat.1: Still destroying... (ID: nat-0394db939a79c3c36, 20s elapsed)
aws_nat_gateway.nat.2: Still destroying... (ID: nat-0c4e6ca95c9386e7c, 20s elapsed)
aws_internet_gateway.igw: Still destroying... (ID: igw-aed4e3ca, 20s elapsed)
aws_nat_gateway.nat.1: Still destroying... (ID: nat-0394db939a79c3c36, 30s elapsed)
aws_nat_gateway.nat.0: Still destroying... (ID: nat-000f11e6e84a954b5, 30s elapsed)
aws_nat_gateway.nat.2: Still destroying... (ID: nat-0c4e6ca95c9386e7c, 30s elapsed)
aws_internet_gateway.igw: Still destroying... (ID: igw-aed4e3ca, 30s elapsed)
aws_nat_gateway.nat.0: Still destroying... (ID: nat-000f11e6e84a954b5, 40s elapsed)
aws_nat_gateway.nat.1: Still destroying... (ID: nat-0394db939a79c3c36, 40s elapsed)
aws_nat_gateway.nat.2: Still destroying... (ID: nat-0c4e6ca95c9386e7c, 40s elapsed)
aws_internet_gateway.igw: Still destroying... (ID: igw-aed4e3ca, 40s elapsed)
aws_nat_gateway.nat.2: Destruction complete
aws_nat_gateway.nat.0: Still destroying... (ID: nat-000f11e6e84a954b5, 50s elapsed)
aws_nat_gateway.nat.1: Still destroying... (ID: nat-0394db939a79c3c36, 50s elapsed)
aws_internet_gateway.igw: Still destroying... (ID: igw-aed4e3ca, 50s elapsed)
aws_nat_gateway.nat.0: Still destroying... (ID: nat-000f11e6e84a954b5, 1m0s elapsed)
aws_nat_gateway.nat.1: Still destroying... (ID: nat-0394db939a79c3c36, 1m0s elapsed)
aws_internet_gateway.igw: Still destroying... (ID: igw-aed4e3ca, 1m0s elapsed)
aws_nat_gateway.nat.0: Destruction complete
aws_nat_gateway.nat.1: Still destroying... (ID: nat-0394db939a79c3c36, 1m10s elapsed)
aws_internet_gateway.igw: Still destroying... (ID: igw-aed4e3ca, 1m10s elapsed)
aws_nat_gateway.nat.1: Destruction complete
aws_subnet.subnet.2: Destroying... (ID: subnet-2cb26f77)
aws_subnet.subnet.1: Destroying... (ID: subnet-93ac35da)
aws_eip.eip.2: Destroying... (ID: eipalloc-235c7a19)
aws_subnet.subnet.0: Destroying... (ID: subnet-828415e5)
aws_eip.eip.0: Destroying... (ID: eipalloc-ba5c7a80)
aws_eip.eip.1: Destroying... (ID: eipalloc-875f79bd)
aws_subnet.subnet.1: Destruction complete
aws_subnet.subnet.2: Destruction complete
aws_eip.eip.2: Destruction complete
aws_eip.eip.0: Destruction complete
aws_eip.eip.1: Destruction complete
aws_subnet.subnet.0: Destruction complete
aws_internet_gateway.igw: Destruction complete
aws_vpc.vpc: Destroying... (ID: vpc-d6fa63b1)
aws_vpc.vpc: Destruction complete
random_id.random: Destroying... (ID: QiB8CZq_ghs)
random_id.random: Destruction complete

Destroy complete! Resources: 21 destroyed.
```
