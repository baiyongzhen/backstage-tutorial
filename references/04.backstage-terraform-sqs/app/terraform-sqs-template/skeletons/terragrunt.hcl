terraform {
  extra_arguments "-var-file" {
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      "${find_in_parent_folders("globals.tfvars", "ignore")}",
      "${find_in_parent_folders("locals.tfvars", "ignore")}"
    ]
  }

}

remote_state {
    backend = "consul"
    config = {
        path = "dev/${path_relative_to_include()}/terraform.tfstate"
        # access_token = "e33eweqeq"
        address = "192.168.56.174:8500"
        scheme = "http"
        datacenter = "dc1"
    }
}
