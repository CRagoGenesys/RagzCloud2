###############################################################################
# All secrets sould be saved in secrets: deployment-secrets
# 								Using it! 
# We extract secrets to environment variables. It will evaluate variables in
# override values by workflow.
###############################################################################
function get_secret {
	# Using: get_secret secret_name
	echo $( kubectl get secrets deployment-secrets -o custom-columns=:data.$1 \
			--no-headers | base64 -d )
}

function replace_overrides {
	# Using: replace_overrides old_value new_value
 	ESCAPED_S=$(printf '%s' "$2" | sed -e 's/[\/&]/\\&/g')
 	cat override_values.yaml | sed "s/$1/$ESCAPED_S/g" > override_values.tmp \
	   && mv override_values.tmp override_values.yaml	
}

function find_in_overrides {
	# Using: find_in_overrides yaml_path [lookup_arg1, lookup_arg2]
	#
	# try to parse by yq (if installed) then by awk (if false set to default)
	
	res=$(cat override_values.yaml | yq eval $1 - 2>/dev/null)
	if [[ ! "$res" ]] && [[ $2 ]] && [[ $3 ]]; then
		res=$(cat override_values.yaml | grep "$2" | grep "$3" \
				| awk '{print $2}')
	fi
	[[ ! "$res" ]] && res="not found"
	echo $res
}
###############################################################################
# 					Postgres address and database
###############################################################################
export POSTGRES_ADDR=$( get_secret POSTGRES_ADDR )
export DB_NAME_GWS=$( get_secret DB_NAME_GWS )
export DB_NAME_PROV=$( get_secret DB_NAME_PROV )
###############################################################################
# 			Postgres admin credentials (uses for creating gauth db)
###############################################################################
export POSTGRES_USER=$( get_secret POSTGRES_USER )
export POSTGRES_PASSWORD=$( get_secret POSTGRES_PASSWORD )
###############################################################################
# 					Postgres gws credentials
###############################################################################
export gws_pg_user=$( get_secret gws_pg_user )
export gws_pg_pass=$( get_secret gws_pg_pass )
###############################################################################
# 			Postgres Agent Setup credentials 
###############################################################################
export gws_as_pg_user=$( get_secret gws_as_pg_user )
export gws_as_pg_pass=$( get_secret gws_as_pg_pass )
###############################################################################
# 						Redis credentials
###############################################################################
export gws_redis_password=$( get_secret gws_redis_password )
###############################################################################
# 						Consul credentials
###############################################################################
export gws_consul_token=$( get_secret gws_consul_token )
###############################################################################
# 		Encrypted client secret generated by GAUTH service for the 
# 					gws-app-provisioning component
###############################################################################
export gws_app_provisioning=$( get_secret gws_app_provisioning )
###############################################################################
# 		Encrypted client secret generated by GAUTH service for  
# 					the gws-app-workspace component
###############################################################################
export gws_app_workspace=$( get_secret gws_app_workspace )
###############################################################################
# 		Client id and Encrypted client secret generated by GAUTH service for:
#				- gws-platform-configuration
#				- gws-platform-datacollector
#				- gws-platform-ixn
#				- gws-platform-ocs
#				- gws-platform-setting
#				- gws-platform-statistics
#				- gws-platform-voice
###############################################################################
export gws_client_id=$( get_secret gws_client_id )
export gws_client_secret=$( get_secret gws_client_secret )
###############################################################################
# Credentials for operational user
###############################################################################
export gws_ops_user=$( get_secret gws_ops_user )
export gws_ops_pass_encr=$( get_secret gws_ops_pass_encr )
###############################################################################


# For validation process need to evaluate release override values here
replace_overrides POSTGRES_ADDR 		$POSTGRES_ADDR
replace_overrides DB_NAME_GWS 			$DB_NAME_GWS
replace_overrides DB_NAME_PROV 			$DB_NAME_PROV
replace_overrides gws_pg_user 			$gws_pg_user
replace_overrides gws_pg_pass 			$gws_pg_pass
replace_overrides gws_as_pg_user 		$gws_as_pg_user
replace_overrides gws_as_pg_pass 		$gws_as_pg_pass
replace_overrides gws_redis_password 	$gws_redis_password
replace_overrides gws_consul_token 		$gws_consul_token
replace_overrides gws_app_provisioning 	$gws_app_provisioning
replace_overrides gws_app_workspace 	$gws_app_workspace
replace_overrides gws_client_id 		$gws_client_id
replace_overrides gws_client_secret 	$gws_client_secret
replace_overrides gws_ops_user 			$gws_ops_user
replace_overrides gws_ops_pass_encr 	$gws_ops_pass_encr

###############################################################################
# Creating GWS DB if not exist and init
###############################################################################
envsubst < init_db.sh > init_db.sh_
kubectl delete pods busybox || true
kubectl run busybox --image=alpine --restart=Never -- sh -c "$(<init_db.sh_)"
sleep 15
kubectl delete pods busybox || true
