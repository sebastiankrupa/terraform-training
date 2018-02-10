# Modern Cloud Infrastructure with Terraform

## Data resources

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
$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.aws_region.current: Refreshing state...
data.aws_vpc.default: Refreshing state...
data.aws_caller_identity.current: Refreshing state...
No changes. Infrastructure is up-to-date.

This means that Terraform did not detect any differences between your
configuration and real physical resources that exist. As a result, Terraform
doesn't need to do anything.
```

### Create the resources

```
$ terraform apply
data.aws_caller_identity.current: Refreshing state...
data.aws_region.current: Refreshing state...
data.aws_vpc.default: Refreshing state...

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

aws_region = eu-west-1
aws_region_endpoint = ec2.eu-west-1.amazonaws.com
caller_arn = arn:aws:iam::...:user/kszczygiel
caller_user = ...
vpc_cidr_block = 172.31.0.0/16
vpc_id = vpc-...
vpc_state = available
```

### Destroy the resources

```
$ terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

data.aws_caller_identity.current: Refreshing state...
data.aws_vpc.default: Refreshing state...
data.aws_region.current: Refreshing state...
data.aws_vpc.default: Destroying... (ID: vpc-63346f07)
data.aws_caller_identity.current: Destroying... (ID: 2017-08-21 11:47:22.697857369 +0000 UTC)
data.aws_region.current: Destroying... (ID: eu-west-1)
data.aws_vpc.default: Destruction complete
data.aws_region.current: Destruction complete
data.aws_caller_identity.current: Destruction complete

Destroy complete! Resources: 3 destroyed.
```
