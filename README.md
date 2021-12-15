# Simple example to show that `terraform` plans differently based on `depends_on`

## Running with Terraform
To run this example with ``terraform``:
1. Set up an AWS user with the following policy:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "ec2:DescribeRegions",
            "Resource": "*"
        }
    ]
}
```
2. Create an AWS profile with the credentials called ```regions-read```.

## Setup
Module ``a`` contains a random resource that changes every time `terraform plan` is run. It can contain any resource that changes.

Module ``b`` contains a data source that reads the regions of an AWS account and outputs them. It can also contain any data source and any resource that depends on a data source. 

To provision module ``b`` after module `a`, a `depends_on` clause can be added to it like this:

```
module "b" {
  source = "./module-b"
  depends_on = [module.a]
}
```

## Scenario 1
- There is no dependency between the modules
- Module `a` changes
- Module `b` doesn't change

When running ``terraform plan``, the plan will contain only changes from module `a`. Since `b` doesn't change, nothing is reflected in the plan.

## Scenario 2
- There is a ``depends_on = [module.a]`` in module `b`
- Module `a` changes
- Module `b` doesn't change

When running ``terraform plan``, the plan will contain changes from module `a` as well as a refresh of data from module `b`, even though `b` itself hasn't changed. 

The refresh of data sources could also cause resources linked to them to change and appear in the plan. This wouldn't happen without the `depends_on` clause.  


