###############################################################################
# Because of using helm-repo as private repository  in gh-workflow,
# we have to reddefine it for installing from public ones 
###############################################################################
helm repo add --force-update helm_repo https://confluentinc.github.io/cp-helm-charts/
helm repo update

oc adm policy add-scc-to-user anyuid -z default -n $NS