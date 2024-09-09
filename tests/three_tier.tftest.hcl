run "three_tier" {
  module {
    source = "./tests/module"
  }

  variables {
    project_domain                     = "default"
    project_tags                       = ["cloud", "test", "tofu"]
    architecture_tiers                 = 3
    create_application_subnetpool      = true
    application_subnetpool_cidr_blocks = ["10.10.128.0/17"]
    create_database_subnetpool         = true
    database_subnetpool_cidr_blocks    = ["192.168.0.0/16"]
    frontend_subnet_prefix_len         = 24
    backend_subnet_prefix_len          = 24
    database_subnet_prefix_len         = 24
    public_nameservers                 = ["9.9.9.9", "9.9.9.10"]
    create_default_secgroups           = true
    database_secgroup_strict           = false
    attach_to_external                 = true
  }

  assert {
    condition = alltrue([for i in module.landing_zone.apps_subnetpool[0].prefixes : can(cidrhost(i, 0))])
    error_message = "The application subnetpool was not created successfully"
  }

  assert {
    condition = alltrue([for i in module.landing_zone.database_subnetpool[0].prefixes : can(cidrhost(i, 0))])
    error_message = "The database subnetpool was not created successfully"
  }

  assert {
    condition = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", module.landing_zone.frontend_network[0].id))
    error_message = "The frontend network was not created successfully"
  }

  assert {
    condition = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", module.landing_zone.backend_network[0].id))
    error_message = "The backend network was not created successfully"
  }

  assert {
    condition = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", module.landing_zone.database_network[0].id))
    error_message = "The database network was not created successfully"
  }

  assert {
    condition = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", module.landing_zone.frontend_subnet[0].id))
    error_message = "The frontend subnet was not created successfully"
  }

  assert {
    condition = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", module.landing_zone.backend_subnet[0].id))
    error_message = "The backend subnet was not created successfully"
  }

  assert {
    condition = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", module.landing_zone.database_subnet[0].id))
    error_message = "The database subnet was not created successfully"
  }
}
