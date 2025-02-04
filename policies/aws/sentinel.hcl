module "tfplan-functions" {
  source = "./tfplan-functions/tfplan-functions.sentinel"
}

policy "restrict-ec2-instance-type" {
    enforcement_level = "soft-mandatory"
}

policy "limit-cost-by-workspace-type" {
    enforcement_level = "hard-mandatory"
}