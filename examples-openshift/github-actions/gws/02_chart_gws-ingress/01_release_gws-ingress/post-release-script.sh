###############################################################################
# Adding routes (specific for OpenShift)
# https://docs.openshift.com/container-platform/3.7/architecture/networking/routes.html
#
# it functions like kubernetes ingress using bult-in HAProxy
###############################################################################

env
oc create route edge --service=gws-service-proxy \
	--hostname=gws.${DOMAIN} --path / --port=gws-service-proxy
