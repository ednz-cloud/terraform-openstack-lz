# terraform-openstack-landing-zone

Terraform/OpenTofu module to deploy a completely customizable OpenStack network architecture.

![Terraform Badge](https://img.shields.io/badge/Terraform-844FBA?logo=terraform&logoColor=fff&style=for-the-badge)
![OpenTofu Badge](https://img.shields.io/badge/OpenTofu-FFDA18?logo=opentofu&logoColor=000&style=for-the-badge)
![OpenStack Badge](https://img.shields.io/badge/OpenStack-ED1944?logo=openstack&logoColor=fff&style=for-the-badge)


<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement_openstack) | >= 1.54 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider_openstack) | >= 1.54 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [openstack_networking_network_v2.backend](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_network_v2) | resource |
| [openstack_networking_network_v2.database](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_network_v2) | resource |
| [openstack_networking_network_v2.frontend](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_network_v2) | resource |
| [openstack_networking_router_interface_v2.backend](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_router_interface_v2) | resource |
| [openstack_networking_router_interface_v2.database](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_router_interface_v2) | resource |
| [openstack_networking_router_interface_v2.frontend](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_router_interface_v2) | resource |
| [openstack_networking_router_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_router_v2) | resource |
| [openstack_networking_secgroup_rule_v2.backend_egress](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_rule_v2.backend_ingress](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_rule_v2.database_egress](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_rule_v2.database_ingress](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_rule_v2.frontend_egress](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_rule_v2.frontend_ingress](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_rule_v2) | resource |
| [openstack_networking_secgroup_v2.backend](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_v2) | resource |
| [openstack_networking_secgroup_v2.database](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_v2) | resource |
| [openstack_networking_secgroup_v2.frontend](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_secgroup_v2) | resource |
| [openstack_networking_subnet_v2.backend](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_subnet_v2) | resource |
| [openstack_networking_subnet_v2.database](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_subnet_v2) | resource |
| [openstack_networking_subnet_v2.frontend](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_subnet_v2) | resource |
| [openstack_networking_subnetpool_v2.apps](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_subnetpool_v2) | resource |
| [openstack_networking_subnetpool_v2.database](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_subnetpool_v2) | resource |
| [openstack_identity_project_v3.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/data-sources/identity_project_v3) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_subnetpool_cidr_blocks"></a> [application_subnetpool_cidr_blocks](#input_application_subnetpool_cidr_blocks) | The CIDR blocks for the application subnet pool | `list(string)` | <pre>[<br>  "192.168.0.0/21"<br>]</pre> | no |
| <a name="input_application_subnetpool_id"></a> [application_subnetpool_id](#input_application_subnetpool_id) | The id of the subnetpool to create the public (first 2 tier) networks from.<br>Since this module can route private subnets to the backbone, it needs to make sure it's not creating overlapping subnets. | `string` | `null` | no |
| <a name="input_architecture_tiers"></a> [architecture_tiers](#input_architecture_tiers) | The type of architecture.<br>Can be either 0, 1, 2 or 3.<br>Tier 0 will not create any subnets or networks.<br>Tier 1 will only create a single frontend subnet.<br>Tier 2 will create a frontend and backend subnet.<br>Tier 3 will create a frontend, backend and database subnet. | `number` | `1` | no |
| <a name="input_attach_to_external"></a> [attach_to_external](#input_attach_to_external) | Whether to attach the router to an external network.<br>This will add a gateway interface to the router, and possibly consume a public IP address which might be billed by your cloud provider. | `bool` | `false` | no |
| <a name="input_backend_subnet_prefix_len"></a> [backend_subnet_prefix_len](#input_backend_subnet_prefix_len) | The prefix length of the backend subnet. Must be between 20 and 32. | `number` | `24` | no |
| <a name="input_create_application_subnetpool"></a> [create_application_subnetpool](#input_create_application_subnetpool) | Whether the module should create an application subnet pool for this project, or use an existing one. | `bool` | `true` | no |
| <a name="input_create_database_subnetpool"></a> [create_database_subnetpool](#input_create_database_subnetpool) | Whether the module should create a database subnet pool for this project, or use an existing one. | `bool` | `true` | no |
| <a name="input_create_default_secgroups"></a> [create_default_secgroups](#input_create_default_secgroups) | Whether to create default security groups or not.<br>Depending on your choice of architecture tiering, will create security groups so that each tier can connect to the one below.<br>Security groups for the database tier will be created for mariadb, postgresql and redis.<br>A default security group allowing ssh connection will also be created. | `bool` | `false` | no |
| <a name="input_database_secgroup_strict"></a> [database_secgroup_strict](#input_database_secgroup_strict) | Defines whether the security groups for the database network should be strict.<br>In strict mode, egress is only allowed to the backend network. | `bool` | `false` | no |
| <a name="input_database_subnet_prefix_len"></a> [database_subnet_prefix_len](#input_database_subnet_prefix_len) | The prefix length of the database subnet. Must be between 24 and 32. | `number` | `24` | no |
| <a name="input_database_subnetpool_cidr_blocks"></a> [database_subnetpool_cidr_blocks](#input_database_subnetpool_cidr_blocks) | The CIDR blocks for the database subnet pool | `list(string)` | <pre>[<br>  "192.168.8.0/23"<br>]</pre> | no |
| <a name="input_database_subnetpool_id"></a> [database_subnetpool_id](#input_database_subnetpool_id) | The id of the subnetpool to create the databse network from.<br>Since this module can route private subnets to the backbone, it needs to make sure it's not creating overlapping subnets. | `string` | `null` | no |
| <a name="input_external_network_id"></a> [external_network_id](#input_external_network_id) | The id of the external network to connect the frontend router to. | `string` | `null` | no |
| <a name="input_frontend_subnet_prefix_len"></a> [frontend_subnet_prefix_len](#input_frontend_subnet_prefix_len) | The prefix length of the frontend subnet. Must be between 20 and 32. | `number` | `24` | no |
| <a name="input_network_internal_domain_name"></a> [network_internal_domain_name](#input_network_internal_domain_name) | The domain name to use for dns resolution inside the private networks | `string` | `null` | no |
| <a name="input_project_domain"></a> [project_domain](#input_project_domain) | The domain where this project will be created | `string` | `"default"` | no |
| <a name="input_project_name"></a> [project_name](#input_project_name) | The name of the project | `string` | n/a | yes |
| <a name="input_project_tags"></a> [project_tags](#input_project_tags) | The tags to append to this project | `list(string)` | `[]` | no |
| <a name="input_public_nameservers"></a> [public_nameservers](#input_public_nameservers) | A list of public DNS servers to upstreams requests to in your subnets.<br>This is not necessary if your openstack deployment already has configured default upstreams for neutron. | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_apps_subnetpool"></a> [apps_subnetpool](#output_apps_subnetpool) | The application subnetpool object (as a list), if created |
| <a name="output_backend_network"></a> [backend_network](#output_backend_network) | The backend network object (as a list), if created |
| <a name="output_backend_secgroups"></a> [backend_secgroups](#output_backend_secgroups) | The backend security group objects (as a list), if created |
| <a name="output_backend_subnet"></a> [backend_subnet](#output_backend_subnet) | The backend subnet object (as a list), if created |
| <a name="output_database_network"></a> [database_network](#output_database_network) | The database network object (as a list), if created |
| <a name="output_database_secgroups"></a> [database_secgroups](#output_database_secgroups) | The database security group objects (as a list), if created |
| <a name="output_database_subnet"></a> [database_subnet](#output_database_subnet) | The database subnet object (as a list), if created |
| <a name="output_database_subnetpool"></a> [database_subnetpool](#output_database_subnetpool) | The database subnetpool object (as a list), if created |
| <a name="output_frontend_network"></a> [frontend_network](#output_frontend_network) | The frontend network object (as a list), if created |
| <a name="output_frontend_secgroups"></a> [frontend_secgroups](#output_frontend_secgroups) | The frontend security group objects (as a list), if created |
| <a name="output_frontend_subnet"></a> [frontend_subnet](#output_frontend_subnet) | The frontend subnet object (as a list), if created |
| <a name="output_router"></a> [router](#output_router) | The entire router object (as a list), if created |
<!-- END_TF_DOCS -->
