#!/bin/bash 

########################################
## Uninstalling monitoring objects 
#######################################

if [ $INPUT_COMMAND == "uninstall" ]
then
  echo "Uninstalling all mcontiroing objects"
  helm uninstall bds-dashboards -n bds
  helm uninstall cxc-dashboards -n cxc
  helm uninstall designer-dashboards -n designer
  helm uninstall gauth-dashboards -n gauth
  helm uninstall gcxi-dashboards -n gcxi
  helm uninstall gsp-dashboards -n gsp
  helm uninstall gim-dashboards -n gim
  helm uninstall gvp-dashboards -n gvp
  helm uninstall gws-dashboards -n gws
  helm uninstall iwddm-dashboards -n iwddm
  helm uninstall ixn-dashboards -n ixn
  helm uninstall nexus-dashboards -n nexus
  helm uninstall pulse-dashboards -n pulse
  helm uninstall tlm-dashboards -n tlm
  helm uninstall ucsx-dashboards -n ucsx
  helm uninstall voice-dashboards -n voice
  helm uninstall webrtc-dashboards -n webrtc
  helm uninstall wwe-dashboards -n wwe
  exit 0
fi


########################################
## Installing monitoring objects 
#######################################
SRV=bds
SRV_DIR=bds-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=cxc
SRV_DIR=cxcontact-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=designer
SRV_DIR=designer-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=gauth
SRV_DIR=gauth-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=gcxi
SRV_DIR=gcxi-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=ges
SRV_DIR=ges-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=gim
SRV_DIR=gim-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
##
SRV=gca
SRV_DIR=gca-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=gsp
SRV_DIR=gsp-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=gvp
SRV_DIR=gvp-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=gws
SRV_DIR=gws-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=iwddm
SRV_DIR=iwddm-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=ixn
SRV_DIR=ixn-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=nexus
SRV_DIR=nexus-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=pulse
SRV_DIR=pulse-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=tlm
SRV_DIR=tlm-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=ucsx
SRV_DIR=ucsx-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=voice
SRV_DIR=voice-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=webrtc
SRV_DIR=webrtc-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi
##
SRV=wwe
SRV_DIR=wwe-service
if [ ! "$(helm list -n $SRV | grep $SRV-dashboards)" ]; then
    echo "$SRV_DIR: Monitoring Objects Missing....Installing with Helm"
    echo Working Dir = $SRV_DIR
    helm upgrade --install $SRV-dashboards ../grafana-dashboards/ -f ./values/$SRV-dashboard-values.yaml -n $SRV --post-renderer ./overlays/$SRV_DIR/kustomize.sh
    echo "### $SRV_DIR monitoring objects deployed ###"
  else
    echo "$SRV-dashboard: Exists....skipping"
fi

echo "### All Monitoring Objects have Been deployed ###"