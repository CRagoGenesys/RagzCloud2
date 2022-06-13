###############################################################################
# Pre-release-script: Replacing ${DOMAIN}  in override-values
###############################################################################

echo "Replacing ${DOMAIN} in file: $(pwd)/override_values.yaml"
cat override_values.yaml | sed "s/\${DOMAIN}/${DOMAIN}/g" > override_values.tmp \
 && mv override_values.tmp override_values.yaml