# depends-on

In terraform if you rely on an *explicit* `depends_on` to run one module after the other,
*any* changes in the upstream module will force a new plan for downstream modules.

**However**, if you rely on an upstream module output (an *implicit* dependency) like the
[`static`](main.tf#L8) variable then terraform will only force a new plan if that var changes.
