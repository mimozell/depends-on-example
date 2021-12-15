# depends-on

In terraform if you rely on a `depends_on` list to run one module after the other, *any* changes
in the upstream module will force a new plan for downstream modules.

But if you rely on a single resource like the [`static`](main.tf#L8) variable then
terraform will only force a new plan if that var changes.
