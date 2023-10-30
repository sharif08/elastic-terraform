
# Apply Auto Index Disable
module "ec-auto-index-disable" {
    source             =   "../../../resource/ec-auto-index-disable"
    apikey             =   ""
    kibana_hostname    =   ""
    kibana_user        =   "elastic"
    kibana_pass        =   ""
    config_file        =   "ec_auto_index_disable"
    config_path        =   "./config"
}


# Create Life Cycle Policy
module "ec-lifecycle-policy" {
    source             =   "../../../resource/ec-lifecycle-policy"
    apikey             =   ""
    kibana_hostname    =   ""
    kibana_user        =   "elastic"
    kibana_pass        =   ""
    config_file        =   "ec_lifecycle_policy"
    lifecycle_name     =   "sharif_first_01"
    config_path        =   "./config"
}
