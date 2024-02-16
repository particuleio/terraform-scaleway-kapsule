resource "scaleway_vpc" "vpc_default" {
    name = "vpc-default"
    tags = distinct(compact(concat(var.vpc_tags, var.tags)))
}
resource "scaleway_vpc_private_network" "pn_default" {
    name   = "pn-default"
    vpc_id = scaleway_vpc.vpc_default.id
    tags   = distinct(compact(concat(var.pn_tags, var.tags)))
}