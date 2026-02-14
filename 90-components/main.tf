module "components" {
    source = "../../terraform-roboshop-component"
    component = var.component
    rule_priority = var.rule_priority
}

module "components" {
    source = ""
    components = var.component
    rule_priority = var.rule_priority
}