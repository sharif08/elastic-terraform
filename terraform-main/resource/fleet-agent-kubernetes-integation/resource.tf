resource "null_resource" "main_exec" {

  provisioner "local-exec" {

    command = <<EOT

       # Policy Info
       A_KUBERNETES=./$${CONFIG_PATH}/$${CONFIG_FILE}


      # Get the Agent Policies ID from the elastic cloud API
      GET_POLICY_ID=$(curl -s -u $${KB_USER}:$${KB_PASS} -X GET --url https://$${URI}/api/fleet/agent_policies | jq . | grep  -B 1 "$${CONFIG_POLICI}" | tr -d  '",' | awk 'NR==1{print $2}')


      # Get the Agent Kubernetes Integartion IP if exit - from elastic cloud API
      GET_PACKAGE_ID=$(curl -s -u $${KB_USER}:$${KB_PASS} -X GET --url https://$${URI}/api/fleet/package_policies | jq . | grep  -B 2 "$${CONFIG_FILE}" | tr -d  '",' | awk 'NR==1{print $2}')


      # Replace the Old ID Agent Policy to New ID Agent Policy
      sed -i "s/policy_id.*/policy_id:\ $${GET_POLICY_ID}/g" $${A_KUBERNETES}.yaml

      # Convert Yaml to Json
      [ -f  $${A_KUBERNETES}.json ] && { rm -rf  $${A_KUBERNETES}.json; \n
        cat "$${A_KUBERNETES}".yaml | yq . >> "$${A_KUBERNETES}".json; } ||  cat "$${A_KUBERNETES}".yaml | yq . >> "$${A_KUBERNETES}".json;


      # if condition Curl POST or PUT Request for elastic cloud API
      if [ "$${GET_PACKAGE_ID}" = "" ];
      then

         # API POST Request
         curl -u $${KB_USER}:$${KB_PASS} --request POST --url https://$${URI}/api/fleet/package_policies -H 'content-type: application/json' -H 'kbn-xsrf: true' -d @$${A_KUBERNETES}.json

      else

         # API PUT or UPDATE Request
         curl -u $${KB_USER}:$${KB_PASS} -X PUT --url https://$${URI}/api/fleet/package_policies/$${GET_PACKAGE_ID} -H 'content-type: application/json' -H 'kbn-xsrf: true' -d @$${A_KUBERNETES}.json
      fi

    EOT

    environment = {
      CONFIG_POLICI = var.agent_file_policy
      CONFIG_FILE   = var.config_file
      CONFIG_PATH   = var.config_path
      KB_USER       = var.kibana_user
      KB_PASS       = var.kibana_pass
      URI           = var.kibana_hostname
     }

   }

}
