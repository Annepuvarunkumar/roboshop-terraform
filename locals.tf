locals {
  vpc_id       = lookup(lookup(module.vpc, "main", null ), "vpc_id", null)
  app_subnets  = [for k,v in lookup(lookup(lookup(lookup(module.vpc, "main", null ), "subnets", null), "app", null), "subnet_ids", null): v.id]
  db_subnets  = [for k,v in lookup(lookup(lookup(lookup(module.vpc, "main", null ), "subnets", null), "db", null), "subnet_ids", null): v.id]

 #cidr....we allow only for app subnets.
  app_subnets_cidr  = [for k,v in lookup(lookup(lookup(lookup(module.vpc, "main", null ), "subnets", null), "app", null), "subnet_ids", null): v.cidr_block]

}

