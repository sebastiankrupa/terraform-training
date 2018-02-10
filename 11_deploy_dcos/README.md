# Modern Cloud Infrastructure with Terraform

## Deploying DC/OS

### Initializing Terraform

```
$ terraform init
Downloading modules (if any)...
Get: file:///Users/kamsz/Documents/Trainings/Modern Cloud Infrastructure with Terraform/11_deploy_dcos/terraform-dcos
Get: file:///Users/kamsz/Documents/Trainings/Modern Cloud Infrastructure with Terraform/11_deploy_dcos/terraform-dcos/modules/dcos-tested-aws-oses
Get: git::https://github.com/bernadinm/tf_dcos_core.git
Get: git::https://github.com/bernadinm/tf_dcos_core.git
Get: git::https://github.com/bernadinm/tf_dcos_core.git
Get: git::https://github.com/bernadinm/tf_dcos_core.git

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

data.external.whoami: Refreshing state...
data.template_file.aws_ami: Refreshing state...
data.template_file.aws_ami_user: Refreshing state...
data.template_file.os-setup: Refreshing state...
The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed. Cyan entries are data sources to be read.

Your plan was also saved to the path below. Call the "apply" subcommand
with this plan file and Terraform will exactly execute this execution
plan.

Path: terraform.plan

(...)

Plan: 40 to add, 0 to change, 0 to destroy.
```

### Create the resources

```
$ terraform apply terraform.plan

(...)

Outputs:

Bootstrap Public IP Address = 54.194.194.139
Master ELB Address = kamsz-tf7a73-pub-mas-elb-1292829593.eu-west-1.elb.amazonaws.com
Mesos Master Public IP = [
    54.154.74.250,
    54.154.23.22,
    54.194.176.220
]
Private Agent Public IP Address = [
    34.253.191.194,
    54.171.110.109
]
Public Agent ELB Address = kamsz-tf7a73-pub-agt-elb-4292729293.eu-west-1.elb.amazonaws.com
Public Agent Public IP Address = [
    54.194.129.221
]
```

### Verify that DC/OS have been installed

Go to `http://Master ELB Address` that has been listed in your Terraform outputs. You should see DC/OS login screen.

### Upgrade DC/OS cluster to newer version

Add below line in your `terraform.tfvars` file:

```
dcos_version = "1.9.0"
```

Then run:

```
$ terraform plan --var state=upgrade -out terraform.plan
$ terraform apply --var state=upgrade terraform.plan
```

Go to `http://Master ELB Address` that has been listed in your Terraform outputs. You should see DC/OS 1.9 login screen.

### Add a public agent

Add below line in your `terraform.tfvars` file:

```
public_agents_count = 2
```

Then run:

```
$ terraform plan -out terraform.plan
$ terraform apply terraform.plan
```

Go to `http://Master ELB Address` that has been listed in your Terraform outputs. In `Nodes` section you should see `4` nodes.
