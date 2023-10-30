resource "null_resource" "main_exec" {

  provisioner "local-exec" {

    command = <<EOT

      EC_LIFECYCLE=./$${CONFIG_PATH}/$${CONFIG_FILE}

      # Convert Yaml to Json
      [ -f  $${EC_LIFECYCLE}.json ] && { rm -rf  $${EC_LIFECYCLE}.json; \n
         cat "$${EC_LIFECYCLE}".yaml | yq . >> "$${EC_LIFECYCLE}".json; } || cat "$${EC_LIFECYCLE}".yaml | yq . >> "$${EC_LIFECYCLE}".json;

      # Curl Request
      curl -s -u $${KB_USER}:$${KB_PASS} -X PUT --url https://$${URI}/_ilm/policy/$${LIFECYCLE_NAME} --header 'content-type: application/json' --header 'kbn-xsrf: true' -d @./$${EC_LIFECYCLE}.json

    EOT

    environment = {
      LIFECYCLE_NAME = var.lifecycle_name
      CONFIG_FILE    = var.config_file
      CONFIG_PATH    = var.config_path
      KB_USER        = var.kibana_user
      KB_PASS        = var.kibana_pass
      URI            = var.kibana_hostname
     }

   }

}
