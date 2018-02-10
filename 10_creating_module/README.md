# Modern Cloud Infrastructure with Terraform

## Creating Terraform modules

### Initializing Terraform

```
$ terraform init
Downloading modules (if any)...
Get: file:///../10_creating_module/vpc
Get: file:///../10_creating_module/igw
Get: file:///../10_creating_module/nat
Get: file:///../10_creating_module/subnet
Get: file:///../10_creating_module/route_table

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

+ module.igw.aws_internet_gateway.igw
    tags.%: "<computed>"
    vpc_id: "${var.vpc_id}"

+ module.igw.random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"

+ module.vpc.aws_vpc.vpc
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

+ module.vpc.random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"

+ module.nat.aws_eip.eip.0
    allocation_id:     "<computed>"
    association_id:    "<computed>"
    domain:            "<computed>"
    instance:          "<computed>"
    network_interface: "<computed>"
    private_ip:        "<computed>"
    public_ip:         "<computed>"
    vpc:               "<computed>"

+ module.nat.aws_eip.eip.1
    allocation_id:     "<computed>"
    association_id:    "<computed>"
    domain:            "<computed>"
    instance:          "<computed>"
    network_interface: "<computed>"
    private_ip:        "<computed>"
    public_ip:         "<computed>"
    vpc:               "<computed>"

+ module.nat.aws_eip.eip.2
    allocation_id:     "<computed>"
    association_id:    "<computed>"
    domain:            "<computed>"
    instance:          "<computed>"
    network_interface: "<computed>"
    private_ip:        "<computed>"
    public_ip:         "<computed>"
    vpc:               "<computed>"

+ module.nat.aws_nat_gateway.nat.0
    allocation_id:        "${element(aws_eip.eip.*.id, count.index)}"
    network_interface_id: "<computed>"
    private_ip:           "<computed>"
    public_ip:            "<computed>"
    subnet_id:            "${element(module.subnet.ids, count.index)}"

+ module.nat.aws_nat_gateway.nat.1
    allocation_id:        "${element(aws_eip.eip.*.id, count.index)}"
    network_interface_id: "<computed>"
    private_ip:           "<computed>"
    public_ip:            "<computed>"
    subnet_id:            "${element(module.subnet.ids, count.index)}"

+ module.nat.aws_nat_gateway.nat.2
    allocation_id:        "${element(aws_eip.eip.*.id, count.index)}"
    network_interface_id: "<computed>"
    private_ip:           "<computed>"
    public_ip:            "<computed>"
    subnet_id:            "${element(module.subnet.ids, count.index)}"

+ module.nat.aws_route.default.0
    destination_cidr_block:     "0.0.0.0/0"
    destination_prefix_list_id: "<computed>"
    egress_only_gateway_id:     "<computed>"
    gateway_id:                 "${var.internet_gateway_id}"
    instance_id:                "<computed>"
    instance_owner_id:          "<computed>"
    nat_gateway_id:             "<computed>"
    network_interface_id:       "<computed>"
    origin:                     "<computed>"
    route_table_id:             "${element(module.route_table.ids, count.index)}"
    state:                      "<computed>"

+ module.nat.aws_route.default.1
    destination_cidr_block:     "0.0.0.0/0"
    destination_prefix_list_id: "<computed>"
    egress_only_gateway_id:     "<computed>"
    gateway_id:                 "${var.internet_gateway_id}"
    instance_id:                "<computed>"
    instance_owner_id:          "<computed>"
    nat_gateway_id:             "<computed>"
    network_interface_id:       "<computed>"
    origin:                     "<computed>"
    route_table_id:             "${element(module.route_table.ids, count.index)}"
    state:                      "<computed>"

+ module.nat.aws_route.default.2
    destination_cidr_block:     "0.0.0.0/0"
    destination_prefix_list_id: "<computed>"
    egress_only_gateway_id:     "<computed>"
    gateway_id:                 "${var.internet_gateway_id}"
    instance_id:                "<computed>"
    instance_owner_id:          "<computed>"
    nat_gateway_id:             "<computed>"
    network_interface_id:       "<computed>"
    origin:                     "<computed>"
    route_table_id:             "${element(module.route_table.ids, count.index)}"
    state:                      "<computed>"

+ module.nat.aws_route_table_association.route_table_association.0
    route_table_id: "${element(module.route_table.ids, count.index)}"
    subnet_id:      "${element(module.subnet.ids, count.index)}"

+ module.nat.aws_route_table_association.route_table_association.1
    route_table_id: "${element(module.route_table.ids, count.index)}"
    subnet_id:      "${element(module.subnet.ids, count.index)}"

+ module.nat.aws_route_table_association.route_table_association.2
    route_table_id: "${element(module.route_table.ids, count.index)}"
    subnet_id:      "${element(module.subnet.ids, count.index)}"

+ module.nat.random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"

+ module.nat.subnet.aws_subnet.subnet.0
    assign_ipv6_address_on_creation: "false"
    availability_zone:               "eu-west-1a"
    cidr_block:                      "172.99.0.0/26"
    ipv6_cidr_block:                 "<computed>"
    ipv6_cidr_block_association_id:  "<computed>"
    map_public_ip_on_launch:         "false"
    tags.%:                          "<computed>"
    vpc_id:                          "${var.vpc_id}"

+ module.nat.subnet.aws_subnet.subnet.1
    assign_ipv6_address_on_creation: "false"
    availability_zone:               "eu-west-1b"
    cidr_block:                      "172.99.0.64/26"
    ipv6_cidr_block:                 "<computed>"
    ipv6_cidr_block_association_id:  "<computed>"
    map_public_ip_on_launch:         "false"
    tags.%:                          "<computed>"
    vpc_id:                          "${var.vpc_id}"

+ module.nat.subnet.aws_subnet.subnet.2
    assign_ipv6_address_on_creation: "false"
    availability_zone:               "eu-west-1c"
    cidr_block:                      "172.99.0.128/26"
    ipv6_cidr_block:                 "<computed>"
    ipv6_cidr_block_association_id:  "<computed>"
    map_public_ip_on_launch:         "false"
    tags.%:                          "<computed>"
    vpc_id:                          "${var.vpc_id}"

+ module.nat.subnet.random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"

+ module.nat.route_table.aws_route_table.route_table.0
    route.#: "<computed>"
    tags.%:  "<computed>"
    vpc_id:  "${var.vpc_id}"

+ module.nat.route_table.aws_route_table.route_table.1
    route.#: "<computed>"
    tags.%:  "<computed>"
    vpc_id:  "${var.vpc_id}"

+ module.nat.route_table.aws_route_table.route_table.2
    route.#: "<computed>"
    tags.%:  "<computed>"
    vpc_id:  "${var.vpc_id}"

+ module.nat.route_table.random_id.random
    b64:         "<computed>"
    b64_std:     "<computed>"
    b64_url:     "<computed>"
    byte_length: "8"
    dec:         "<computed>"
    hex:         "<computed>"


Plan: 25 to add, 0 to change, 0 to destroy.
```

### Create the resources

```
$ terraform apply terraform.plan
module.nat.random_id.random: Creating...
  b64:         "" => "<computed>"
  b64_std:     "" => "<computed>"
  b64_url:     "" => "<computed>"
  byte_length: "" => "8"
  dec:         "" => "<computed>"
  hex:         "" => "<computed>"
module.vpc.random_id.random: Creating...
  b64:         "" => "<computed>"
  b64_std:     "" => "<computed>"
  b64_url:     "" => "<computed>"
  byte_length: "" => "8"
  dec:         "" => "<computed>"
  hex:         "" => "<computed>"
module.igw.random_id.random: Creating...
  b64:         "" => "<computed>"
  b64_std:     "" => "<computed>"
  b64_url:     "" => "<computed>"
  byte_length: "" => "8"
  dec:         "" => "<computed>"
  hex:         "" => "<computed>"
module.nat.route_table.random_id.random: Creating...
  b64:         "" => "<computed>"
  b64_std:     "" => "<computed>"
  b64_url:     "" => "<computed>"
  byte_length: "" => "8"
  dec:         "" => "<computed>"
  hex:         "" => "<computed>"
module.nat.subnet.random_id.random: Creating...
  b64:         "" => "<computed>"
  b64_std:     "" => "<computed>"
  b64_url:     "" => "<computed>"
  byte_length: "" => "8"
  dec:         "" => "<computed>"
  hex:         "" => "<computed>"
module.nat.route_table.random_id.random: Creation complete (ID: 7Bz2gS8o5yc)
module.vpc.random_id.random: Creation complete (ID: Fem2zim_aJA)
module.nat.subnet.random_id.random: Creation complete (ID: 5SSz1uXb-gw)
module.igw.random_id.random: Creation complete (ID: uuHZz9aPwFg)
module.nat.random_id.random: Creation complete (ID: -XWIxT2WAG4)
module.nat.aws_eip.eip.1: Creating...
  allocation_id:     "" => "<computed>"
  association_id:    "" => "<computed>"
  domain:            "" => "<computed>"
  instance:          "" => "<computed>"
  network_interface: "" => "<computed>"
  private_ip:        "" => "<computed>"
  public_ip:         "" => "<computed>"
  vpc:               "" => "<computed>"
module.nat.aws_eip.eip.2: Creating...
  allocation_id:     "" => "<computed>"
  association_id:    "" => "<computed>"
  domain:            "" => "<computed>"
  instance:          "" => "<computed>"
  network_interface: "" => "<computed>"
  private_ip:        "" => "<computed>"
  public_ip:         "" => "<computed>"
  vpc:               "" => "<computed>"
module.nat.aws_eip.eip.0: Creating...
  allocation_id:     "" => "<computed>"
  association_id:    "" => "<computed>"
  domain:            "" => "<computed>"
  instance:          "" => "<computed>"
  network_interface: "" => "<computed>"
  private_ip:        "" => "<computed>"
  public_ip:         "" => "<computed>"
  vpc:               "" => "<computed>"
module.vpc.aws_vpc.vpc: Creating...
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
  tags.Name:                        "" => "tfworkshop-15e9b6ce29bf6890"
module.nat.aws_eip.eip.0: Creation complete (ID: eipalloc-b726008d)
module.nat.aws_eip.eip.1: Creation complete (ID: eipalloc-73200649)
module.nat.aws_eip.eip.2: Creation complete (ID: eipalloc-1d240227)
module.vpc.aws_vpc.vpc: Creation complete (ID: vpc-eaea738d)
module.igw.aws_internet_gateway.igw: Creating...
  tags.%:           "0" => "2"
  tags.Environment: "" => "tfworkshop"
  tags.Name:        "" => "igw-tfworkshop-bae1d9cfd68fc058"
  vpc_id:           "" => "vpc-eaea738d"
module.nat.route_table.aws_route_table.route_table.1: Creating...
  route.#:          "" => "<computed>"
  tags.%:           "" => "2"
  tags.Environment: "" => "tfworkshop"
  tags.Name:        "" => "nat-eu-west-1b-tfworkshop-ec1cf6812f28e727"
  vpc_id:           "" => "vpc-eaea738d"
module.nat.route_table.aws_route_table.route_table.2: Creating...
  route.#:          "" => "<computed>"
  tags.%:           "" => "2"
  tags.Environment: "" => "tfworkshop"
  tags.Name:        "" => "nat-eu-west-1c-tfworkshop-ec1cf6812f28e727"
  vpc_id:           "" => "vpc-eaea738d"
module.nat.subnet.aws_subnet.subnet.1: Creating...
  assign_ipv6_address_on_creation: "" => "false"
  availability_zone:               "" => "eu-west-1b"
  cidr_block:                      "" => "172.99.0.64/26"
  ipv6_cidr_block:                 "" => "<computed>"
  ipv6_cidr_block_association_id:  "" => "<computed>"
  map_public_ip_on_launch:         "" => "false"
  tags.%:                          "" => "2"
  tags.Environment:                "" => "tfworkshop"
  tags.Name:                       "" => "nat-eu-west-1b-tfworkshop-e524b3d6e5dbfa0c"
  vpc_id:                          "" => "vpc-eaea738d"
module.nat.subnet.aws_subnet.subnet.0: Creating...
  assign_ipv6_address_on_creation: "" => "false"
  availability_zone:               "" => "eu-west-1a"
  cidr_block:                      "" => "172.99.0.0/26"
  ipv6_cidr_block:                 "" => "<computed>"
  ipv6_cidr_block_association_id:  "" => "<computed>"
  map_public_ip_on_launch:         "" => "false"
  tags.%:                          "" => "2"
  tags.Environment:                "" => "tfworkshop"
  tags.Name:                       "" => "nat-eu-west-1a-tfworkshop-e524b3d6e5dbfa0c"
  vpc_id:                          "" => "vpc-eaea738d"
module.nat.route_table.aws_route_table.route_table.0: Creating...
  route.#:          "" => "<computed>"
  tags.%:           "" => "2"
  tags.Environment: "" => "tfworkshop"
  tags.Name:        "" => "nat-eu-west-1a-tfworkshop-ec1cf6812f28e727"
  vpc_id:           "" => "vpc-eaea738d"
module.nat.subnet.aws_subnet.subnet.2: Creating...
  assign_ipv6_address_on_creation: "" => "false"
  availability_zone:               "" => "eu-west-1c"
  cidr_block:                      "" => "172.99.0.128/26"
  ipv6_cidr_block:                 "" => "<computed>"
  ipv6_cidr_block_association_id:  "" => "<computed>"
  map_public_ip_on_launch:         "" => "false"
  tags.%:                          "" => "2"
  tags.Environment:                "" => "tfworkshop"
  tags.Name:                       "" => "nat-eu-west-1c-tfworkshop-e524b3d6e5dbfa0c"
  vpc_id:                          "" => "vpc-eaea738d"
module.nat.route_table.aws_route_table.route_table.2: Creation complete (ID: rtb-0d6faa6b)
module.nat.route_table.aws_route_table.route_table.1: Creation complete (ID: rtb-946eabf2)
module.nat.route_table.aws_route_table.route_table.0: Creation complete (ID: rtb-776faa11)
module.igw.aws_internet_gateway.igw: Creation complete (ID: igw-51c4f335)
module.nat.aws_route.default.0: Creating...
  destination_cidr_block:     "" => "0.0.0.0/0"
  destination_prefix_list_id: "" => "<computed>"
  egress_only_gateway_id:     "" => "<computed>"
  gateway_id:                 "" => "igw-51c4f335"
  instance_id:                "" => "<computed>"
  instance_owner_id:          "" => "<computed>"
  nat_gateway_id:             "" => "<computed>"
  network_interface_id:       "" => "<computed>"
  origin:                     "" => "<computed>"
  route_table_id:             "" => "rtb-776faa11"
  state:                      "" => "<computed>"
module.nat.aws_route.default.2: Creating...
  destination_cidr_block:     "" => "0.0.0.0/0"
  destination_prefix_list_id: "" => "<computed>"
  egress_only_gateway_id:     "" => "<computed>"
  gateway_id:                 "" => "igw-51c4f335"
  instance_id:                "" => "<computed>"
  instance_owner_id:          "" => "<computed>"
  nat_gateway_id:             "" => "<computed>"
  network_interface_id:       "" => "<computed>"
  origin:                     "" => "<computed>"
  route_table_id:             "" => "rtb-0d6faa6b"
  state:                      "" => "<computed>"
module.nat.aws_route.default.1: Creating...
  destination_cidr_block:     "" => "0.0.0.0/0"
  destination_prefix_list_id: "" => "<computed>"
  egress_only_gateway_id:     "" => "<computed>"
  gateway_id:                 "" => "igw-51c4f335"
  instance_id:                "" => "<computed>"
  instance_owner_id:          "" => "<computed>"
  nat_gateway_id:             "" => "<computed>"
  network_interface_id:       "" => "<computed>"
  origin:                     "" => "<computed>"
  route_table_id:             "" => "rtb-946eabf2"
  state:                      "" => "<computed>"
module.nat.subnet.aws_subnet.subnet.2: Creation complete (ID: subnet-53de0308)
module.nat.subnet.aws_subnet.subnet.1: Creation complete (ID: subnet-d05dc499)
module.nat.subnet.aws_subnet.subnet.0: Creation complete (ID: subnet-54b72633)
module.nat.aws_route_table_association.route_table_association.0: Creating...
  route_table_id: "" => "rtb-776faa11"
  subnet_id:      "" => "subnet-54b72633"
module.nat.aws_nat_gateway.nat.2: Creating...
  allocation_id:        "" => "eipalloc-1d240227"
  network_interface_id: "" => "<computed>"
  private_ip:           "" => "<computed>"
  public_ip:            "" => "<computed>"
  subnet_id:            "" => "subnet-53de0308"
module.nat.aws_route_table_association.route_table_association.2: Creating...
  route_table_id: "" => "rtb-0d6faa6b"
  subnet_id:      "" => "subnet-53de0308"
module.nat.aws_nat_gateway.nat.1: Creating...
  allocation_id:        "" => "eipalloc-73200649"
  network_interface_id: "" => "<computed>"
  private_ip:           "" => "<computed>"
  public_ip:            "" => "<computed>"
  subnet_id:            "" => "subnet-d05dc499"
module.nat.aws_nat_gateway.nat.0: Creating...
  allocation_id:        "" => "eipalloc-b726008d"
  network_interface_id: "" => "<computed>"
  private_ip:           "" => "<computed>"
  public_ip:            "" => "<computed>"
  subnet_id:            "" => "subnet-54b72633"
module.nat.aws_route_table_association.route_table_association.1: Creating...
  route_table_id: "" => "rtb-946eabf2"
  subnet_id:      "" => "subnet-d05dc499"
module.nat.aws_route_table_association.route_table_association.0: Creation complete (ID: rtbassoc-19ae5460)
module.nat.aws_route_table_association.route_table_association.1: Creation complete (ID: rtbassoc-58af5521)
module.nat.aws_route_table_association.route_table_association.2: Creation complete (ID: rtbassoc-3faa5046)
module.nat.aws_route.default.2: Creation complete (ID: r-rtb-0d6faa6b1080289494)
module.nat.aws_route.default.1: Creation complete (ID: r-rtb-946eabf21080289494)
module.nat.aws_route.default.0: Creation complete (ID: r-rtb-776faa111080289494)
module.nat.aws_nat_gateway.nat.2: Still creating... (10s elapsed)
module.nat.aws_nat_gateway.nat.1: Still creating... (10s elapsed)
module.nat.aws_nat_gateway.nat.0: Still creating... (10s elapsed)
module.nat.aws_nat_gateway.nat.2: Still creating... (20s elapsed)
module.nat.aws_nat_gateway.nat.1: Still creating... (20s elapsed)
module.nat.aws_nat_gateway.nat.0: Still creating... (20s elapsed)
module.nat.aws_nat_gateway.nat.0: Still creating... (30s elapsed)
module.nat.aws_nat_gateway.nat.2: Still creating... (30s elapsed)
module.nat.aws_nat_gateway.nat.1: Still creating... (30s elapsed)
module.nat.aws_nat_gateway.nat.1: Still creating... (40s elapsed)
module.nat.aws_nat_gateway.nat.2: Still creating... (40s elapsed)
module.nat.aws_nat_gateway.nat.0: Still creating... (40s elapsed)
module.nat.aws_nat_gateway.nat.1: Still creating... (50s elapsed)
module.nat.aws_nat_gateway.nat.2: Still creating... (50s elapsed)
module.nat.aws_nat_gateway.nat.0: Still creating... (50s elapsed)
module.nat.aws_nat_gateway.nat.1: Still creating... (1m0s elapsed)
module.nat.aws_nat_gateway.nat.0: Still creating... (1m0s elapsed)
module.nat.aws_nat_gateway.nat.2: Still creating... (1m0s elapsed)
module.nat.aws_nat_gateway.nat.1: Still creating... (1m10s elapsed)
module.nat.aws_nat_gateway.nat.2: Still creating... (1m10s elapsed)
module.nat.aws_nat_gateway.nat.0: Still creating... (1m10s elapsed)
module.nat.aws_nat_gateway.nat.1: Still creating... (1m20s elapsed)
module.nat.aws_nat_gateway.nat.2: Still creating... (1m20s elapsed)
module.nat.aws_nat_gateway.nat.0: Still creating... (1m20s elapsed)
module.nat.aws_nat_gateway.nat.2: Still creating... (1m30s elapsed)
module.nat.aws_nat_gateway.nat.0: Still creating... (1m30s elapsed)
module.nat.aws_nat_gateway.nat.1: Still creating... (1m30s elapsed)
module.nat.aws_nat_gateway.nat.2: Creation complete (ID: nat-07ddbfac0f617caf2)
module.nat.aws_nat_gateway.nat.0: Still creating... (1m40s elapsed)
module.nat.aws_nat_gateway.nat.1: Still creating... (1m40s elapsed)
module.nat.aws_nat_gateway.nat.1: Creation complete (ID: nat-0fb65089265caaee8)
module.nat.aws_nat_gateway.nat.0: Still creating... (1m50s elapsed)
module.nat.aws_nat_gateway.nat.0: Still creating... (2m0s elapsed)
module.nat.aws_nat_gateway.nat.0: Creation complete (ID: nat-09caf234b57ad7512)

Apply complete! Resources: 25 added, 0 changed, 0 destroyed.

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

random_id.random: Refreshing state... (ID: uuHZz9aPwFg)
random_id.random: Refreshing state... (ID: Fem2zim_aJA)
random_id.random: Refreshing state... (ID: -XWIxT2WAG4)
random_id.random: Refreshing state... (ID: 5SSz1uXb-gw)
random_id.random: Refreshing state... (ID: 7Bz2gS8o5yc)
aws_eip.eip.2: Refreshing state... (ID: eipalloc-1d240227)
aws_eip.eip.1: Refreshing state... (ID: eipalloc-73200649)
aws_eip.eip.0: Refreshing state... (ID: eipalloc-b726008d)
aws_vpc.vpc: Refreshing state... (ID: vpc-eaea738d)
aws_internet_gateway.igw: Refreshing state... (ID: igw-51c4f335)
aws_subnet.subnet.0: Refreshing state... (ID: subnet-54b72633)
aws_subnet.subnet.2: Refreshing state... (ID: subnet-53de0308)
aws_subnet.subnet.1: Refreshing state... (ID: subnet-d05dc499)
aws_route_table.route_table.0: Refreshing state... (ID: rtb-776faa11)
aws_route_table.route_table.1: Refreshing state... (ID: rtb-946eabf2)
aws_route_table.route_table.2: Refreshing state... (ID: rtb-0d6faa6b)
aws_nat_gateway.nat.0: Refreshing state... (ID: nat-09caf234b57ad7512)
aws_nat_gateway.nat.1: Refreshing state... (ID: nat-0fb65089265caaee8)
aws_nat_gateway.nat.2: Refreshing state... (ID: nat-07ddbfac0f617caf2)
aws_route_table_association.route_table_association.2: Refreshing state... (ID: rtbassoc-3faa5046)
aws_route.default.1: Refreshing state... (ID: r-rtb-946eabf21080289494)
aws_route_table_association.route_table_association.1: Refreshing state... (ID: rtbassoc-58af5521)
aws_route.default.0: Refreshing state... (ID: r-rtb-776faa111080289494)
aws_route.default.2: Refreshing state... (ID: r-rtb-0d6faa6b1080289494)
aws_route_table_association.route_table_association.0: Refreshing state... (ID: rtbassoc-19ae5460)
module.nat.random_id.random: Destroying... (ID: -XWIxT2WAG4)
module.nat.random_id.random: Destruction complete
module.nat.aws_route.default.1: Destroying... (ID: r-rtb-946eabf21080289494)
module.nat.aws_route.default.0: Destroying... (ID: r-rtb-776faa111080289494)
module.nat.aws_route_table_association.route_table_association.0: Destroying... (ID: rtbassoc-19ae5460)
module.nat.aws_nat_gateway.nat.2: Destroying... (ID: nat-07ddbfac0f617caf2)
module.nat.aws_route_table_association.route_table_association.1: Destroying... (ID: rtbassoc-58af5521)
module.nat.aws_nat_gateway.nat.0: Destroying... (ID: nat-09caf234b57ad7512)
module.nat.aws_nat_gateway.nat.1: Destroying... (ID: nat-0fb65089265caaee8)
module.nat.aws_route_table_association.route_table_association.2: Destroying... (ID: rtbassoc-3faa5046)
module.nat.aws_route.default.2: Destroying... (ID: r-rtb-0d6faa6b1080289494)
module.nat.aws_route_table_association.route_table_association.0: Destruction complete
module.nat.aws_route.default.1: Destruction complete
module.nat.aws_route.default.2: Destruction complete
module.nat.aws_route.default.0: Destruction complete
module.nat.aws_route_table_association.route_table_association.1: Destruction complete
module.igw.aws_internet_gateway.igw: Destroying... (ID: igw-51c4f335)
module.nat.aws_route_table_association.route_table_association.2: Destruction complete
module.nat.route_table.aws_route_table.route_table.1: Destroying... (ID: rtb-946eabf2)
module.nat.route_table.aws_route_table.route_table.2: Destroying... (ID: rtb-0d6faa6b)
module.nat.route_table.aws_route_table.route_table.0: Destroying... (ID: rtb-776faa11)
module.nat.route_table.aws_route_table.route_table.0: Destruction complete
module.nat.route_table.aws_route_table.route_table.1: Destruction complete
module.nat.route_table.aws_route_table.route_table.2: Destruction complete
module.nat.route_table.random_id.random: Destroying... (ID: 7Bz2gS8o5yc)
module.nat.route_table.random_id.random: Destruction complete
module.nat.aws_nat_gateway.nat.2: Still destroying... (ID: nat-07ddbfac0f617caf2, 10s elapsed)
module.nat.aws_nat_gateway.nat.0: Still destroying... (ID: nat-09caf234b57ad7512, 10s elapsed)
module.nat.aws_nat_gateway.nat.1: Still destroying... (ID: nat-0fb65089265caaee8, 10s elapsed)
module.igw.aws_internet_gateway.igw: Still destroying... (ID: igw-51c4f335, 10s elapsed)
module.nat.aws_nat_gateway.nat.2: Still destroying... (ID: nat-07ddbfac0f617caf2, 20s elapsed)
module.nat.aws_nat_gateway.nat.0: Still destroying... (ID: nat-09caf234b57ad7512, 20s elapsed)
module.nat.aws_nat_gateway.nat.1: Still destroying... (ID: nat-0fb65089265caaee8, 20s elapsed)
module.igw.aws_internet_gateway.igw: Still destroying... (ID: igw-51c4f335, 20s elapsed)
module.nat.aws_nat_gateway.nat.2: Still destroying... (ID: nat-07ddbfac0f617caf2, 30s elapsed)
module.nat.aws_nat_gateway.nat.0: Still destroying... (ID: nat-09caf234b57ad7512, 30s elapsed)
module.nat.aws_nat_gateway.nat.1: Still destroying... (ID: nat-0fb65089265caaee8, 30s elapsed)
module.igw.aws_internet_gateway.igw: Still destroying... (ID: igw-51c4f335, 30s elapsed)
module.nat.aws_nat_gateway.nat.2: Still destroying... (ID: nat-07ddbfac0f617caf2, 40s elapsed)
module.nat.aws_nat_gateway.nat.0: Still destroying... (ID: nat-09caf234b57ad7512, 40s elapsed)
module.nat.aws_nat_gateway.nat.1: Still destroying... (ID: nat-0fb65089265caaee8, 40s elapsed)
module.igw.aws_internet_gateway.igw: Still destroying... (ID: igw-51c4f335, 40s elapsed)
module.nat.aws_nat_gateway.nat.2: Still destroying... (ID: nat-07ddbfac0f617caf2, 50s elapsed)
module.nat.aws_nat_gateway.nat.0: Still destroying... (ID: nat-09caf234b57ad7512, 50s elapsed)
module.nat.aws_nat_gateway.nat.1: Still destroying... (ID: nat-0fb65089265caaee8, 50s elapsed)
module.igw.aws_internet_gateway.igw: Still destroying... (ID: igw-51c4f335, 50s elapsed)
module.nat.aws_nat_gateway.nat.0: Still destroying... (ID: nat-09caf234b57ad7512, 1m0s elapsed)
module.nat.aws_nat_gateway.nat.2: Still destroying... (ID: nat-07ddbfac0f617caf2, 1m0s elapsed)
module.nat.aws_nat_gateway.nat.1: Still destroying... (ID: nat-0fb65089265caaee8, 1m0s elapsed)
module.igw.aws_internet_gateway.igw: Still destroying... (ID: igw-51c4f335, 1m0s elapsed)
module.nat.aws_nat_gateway.nat.0: Destruction complete
module.nat.aws_nat_gateway.nat.1: Destruction complete
module.nat.aws_nat_gateway.nat.2: Still destroying... (ID: nat-07ddbfac0f617caf2, 1m10s elapsed)
module.igw.aws_internet_gateway.igw: Still destroying... (ID: igw-51c4f335, 1m10s elapsed)
module.nat.aws_nat_gateway.nat.2: Destruction complete
module.nat.aws_eip.eip.0: Destroying... (ID: eipalloc-b726008d)
module.nat.subnet.aws_subnet.subnet.2: Destroying... (ID: subnet-53de0308)
module.nat.subnet.aws_subnet.subnet.1: Destroying... (ID: subnet-d05dc499)
module.nat.aws_eip.eip.2: Destroying... (ID: eipalloc-1d240227)
module.nat.aws_eip.eip.1: Destroying... (ID: eipalloc-73200649)
module.nat.subnet.aws_subnet.subnet.0: Destroying... (ID: subnet-54b72633)
module.nat.subnet.aws_subnet.subnet.2: Destruction complete
module.nat.subnet.aws_subnet.subnet.0: Destruction complete
module.nat.subnet.aws_subnet.subnet.1: Destruction complete
module.nat.subnet.random_id.random: Destroying... (ID: 5SSz1uXb-gw)
module.nat.subnet.random_id.random: Destruction complete
module.nat.aws_eip.eip.0: Destruction complete
module.nat.aws_eip.eip.1: Destruction complete
module.nat.aws_eip.eip.2: Destruction complete
module.igw.aws_internet_gateway.igw: Destruction complete
module.vpc.aws_vpc.vpc: Destroying... (ID: vpc-eaea738d)
module.igw.random_id.random: Destroying... (ID: uuHZz9aPwFg)
module.igw.random_id.random: Destruction complete
module.vpc.aws_vpc.vpc: Destruction complete
module.vpc.random_id.random: Destroying... (ID: Fem2zim_aJA)
module.vpc.random_id.random: Destruction complete

Destroy complete! Resources: 25 destroyed.
```
