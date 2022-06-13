# Getting Started

## TL;DR

 deploy Prometheus Alert Rules, and Grafana Dashboards. 

> `git clone https://github.com/genesys/multicloud-services.git`
>
>`cd ./multicloud-services/tools/grafana-dashboards`
>
>`export INPUT_COMMAND=install|uninstall`
>
>`./install-monitoring.sh`


## Prerequisites

This guide expects you have completed a full installation of the following services in your cluster:   

- Promethus/Alertmanager
- Grafana

Following service must be deployed on local client or runners: 
- kustomize

For further details installing required services: 

- Prometheus/AlertManager: https://github.com/prometheus-operator/prometheus-operator
- Grafana: https://github.com/grafana-operator/grafana-operator
- kustomize: https://github.com/kubernetes-sigs/kustomize

## Overview
Each Genesys service comes with a set of monitoring objects required for service observability. This is done on a per-service basis via helm charts.  

This tool is intended to provide an all-in-one deployment of the following monitoring objects prior to installation of Genesys services, removing the need for enabling them per-service.  

- Prometheus AlertRules
- GrafanaDashboard CRDs 
- Dashboard configMaps

**Note**: Existing configration will impact deployment of objects installed by this script. This should be ran after creation of required genesys namespaces, prior to deployment of services. 




## Kustomize Overlay Structure: 

Kustomize provides the ability to render custom configruation
using yaml resource files. 

> ```
> ~/overlays
> ├── all.yaml     <---- temp file used to store helm output for post-rendering
> ├── kustomization.yaml  <--- kustomize config file
> ├── kustomize.sh   <---- script to excute kustomize 
> └── $monitoringObject.yaml  <------ resource yaml 
> ```

**NOTE**: If required you can add addtional resouce yaml to an existing overlay folder structure. Any addtional yaml file must be added to the overlays folder must be added to the `kustomization.yaml` file as an addtional resouce: 

eg. 

>```
>   apiVersion: kustomize.config.k8s.io/v1beta1
>   kind: Kustomization
>   namespace: gcxi
>   generatorOptions:
>       disableNameSuffixHash: true
>   commonLabels:
>       app: grafana
>   resources:
>   - all.yaml
>   - gcxi-prometheusrule.yaml
>   - addtional_resource_1.yaml
>   - addtional_resource_2.yaml 
>   configMapGenerator:
>   - name: gcxi-health
>     files: 
>     - gcxi-health.json
>   - name: gcxi-pods
>     files: 
>     - gcxi-pods.json

*for further detials on avaiable kustomize options see: https://kubectl.docs.kubernetes.io/guides/* 

## All-In-One Deployment of monitoring objects
From the **\multicloud-services\tools\grafana-dashboards** folder execute the following to set proper input command: 

> ``export INPUT_COMMAND=install``

once set execute the install-monitoring script to start deploy of monitoring objects.

> `./install-monitoring.sh`


**NOTE**: script will check for existing $service-dashboard helm releases and will skip all services that already exist. 

**IMPORTANT**: Any objects deployed as part of service helm charts will not be identified and will impact deployment of objects for that service. If monitoring objects are already installed via service helm charts, see "**Deploying GrafanaDasbhoard CRDs Only**" below. 

## All-in-One Uninstall

> ``export INPUT_COMMAND=uninstall``

once set execute the install-monitoring script to remove all monitoring objects.

> `./install-monitoring.sh`


## Manual deployment of single service monitoring objects 

From the `\CPE-PublicRepo-Staging\tools\grafana-dashboards` folder, execute the following helm installation syntax to install the appGrafanaDashboard CRDs for each service you're setting up:

>   ``helm upgrade --install $RELEASE_NAME ../> >  grafana-dashboards/ -f ./values/$SERVICE-dashboard-values.>   yaml -n $NAMEPACE --post-renderer ./overlays/> $SERVICE-service/kustomize.sh``

Example using GCXI:

>```helm upgrade --install gxci-grafana-dashboards ../grafana-dashboards/ -f ../grafana-dashboards/values/gcxi-dashboard-values.yaml -n gcxi --post-renderer ./overlays/gcxi-service/kustomize.sh```


## Deploying GrafanaDasbhoard CRDs Only: 

>``helm upgrade --install $RELEASE_NAME ../grafana-dashboards/ -f ./values/$SERVICE-dashboard-values.yaml -n $NAMEPACE``


Example using GCXI:

>``helm upgrade --install gxci-grafana-dashboards ../grafana-dashboards/ -f ../grafana-dashboards/values/gcxi-dashboard-values.yaml -n gcxi``

## Manual uninstall steps


>``helm delete $RELEASE_NAME -n $NAMESPACE``

Example using GCXI:

>``helm delete gxci-grafana-dashboards -n gcxi``
