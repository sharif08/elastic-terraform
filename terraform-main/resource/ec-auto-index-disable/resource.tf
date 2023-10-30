resource "null_resource" "main_exec" {

  provisioner "local-exec" {

    command = <<EOT

      EC_AUTO_INDEX=./$${CONFIG_PATH}/$${CONFIG_FILE}

      # Convert Yaml to Json
      [ -f  $${EC_AUTO_INDEX}.json ] && { rm -rf  $${EC_AUTO_INDEX}.json; \n
         cat "$${EC_AUTO_INDEX}".yaml | yq . >> "$${EC_AUTO_INDEX}".json; } || cat "$${EC_AUTO_INDEX}".yaml | yq . >> "$${EC_AUTO_INDEX}".json;

      # Curl Request
      curl -s -u $${KB_USER}:$${KB_PASS} -X PUT --url https://$${URI}/_cluster/settings --header 'content-type: application/json' --header 'kbn-xsrf: true' -d @./$${EC_AUTO_INDEX}.json

    EOT

    environment = {
      CONFIG_FILE  = var.config_file
      CONFIG_PATH  = var.config_path
      KB_USER      = var.kibana_user
      KB_PASS      = var.kibana_pass
      URI          = var.kibana_hostname
     }

   }

}
