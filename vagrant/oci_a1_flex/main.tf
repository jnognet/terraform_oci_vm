terraform {
  required_version = ">= 0.12.6"
  required_providers {
    oci = {
      version = ">= 4.0.0"
    }
  }
}                                                        
                                                          
provider "oci" {                                          
  region              = "sa-saopaulo-1"                    
  auth                = "SecurityToken"                   
  config_file_profile = "terraform"                 
}                                                         

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Oracle Java Management Service"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "zsXH:SA-SAOPAULO-1-AD-1"
	compartment_id = "ocid1.compartment.oc1..aaaaaaaa3fhyvxw4mbvasst2skoiuhv4esihat3lafqb3ubdisl2567mdvoa"
	create_vnic_details {
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		subnet_id = "ocid1.subnet.oc1.sa-saopaulo-1.aaaaaaaa24426h4p53v3gb4fr6qdgbmzbrhtfzenyav5l4paf5e3eynmpqma"
	}
	display_name = "instance-20221113-0255"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	is_pv_encryption_in_transit_enabled = "true"
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa XXX nt@n"
	}
	shape = "VM.Standard.A1.Flex"
	shape_config {
		memory_in_gbs = "24"
		ocpus = "4"
	}
	source_details {
		source_id = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaogysf6h6pk6doxod4auquxipelugz5yssrvtwi2jarjc3kxz5xvq"
		source_type = "image"
	}

}
