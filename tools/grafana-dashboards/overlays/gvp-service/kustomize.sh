#!/bin/bash
SRV_DIR=gvp-service
# save incoming YAML to file
cat <&0 > ./overlays/$SRV_DIR/all.yaml

# modify the YAML with kustomize
kustomize build ./overlays/$SRV_DIR ##&& rm ./$srv_dir/all.yaml 
