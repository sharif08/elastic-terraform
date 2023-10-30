resource "null_resource" "main_exec" {

  provisioner "local-exec" {

    command = <<EOT

      # Agent Policy Info
      A_POLICY=./$${CONFIG_PATH}/$${CONFIG_FILE}


      # Convert Yaml to Json
      [ -f  $${A_POLICY}.json ] && { rm -rf  $${A_POLICY}.json; \n
         cat "$${A_POLICY}".yaml | yq . >> "$${A_POLICY}".json; } || cat "$${A_POLICY}".yaml | yq . >> "$${A_POLICY}".json;

      # Curl Request
      curl -u $${KB_USER}:$${KB_PASS} --request POST --url https://$${URI}/api/fleet/agent_policies --header 'content-type: application/json' --header 'kbn-xsrf: true' -d @./$${A_POLICY}.json
    EOT

    environment = {
      CONFIG_PATH  = var.config_path
      CONFIG_FILE  = var.config_file
      KB_USER      = var.kibana_user
      KB_PASS      = var.kibana_pass
      URI          = var.kibana_hostname
     }

   }

}
