
patch_deployment() {
    oc patch bc/testing-bc -p '{"spec":{"template":{"spec":{"nodeSelector":{"kubernetes.io/hostname":"lnxprodvm1111"}}}}}'
}

patch_namespace() {
    # apiVersion: v1
    # kind: Namespace
    # metadata:
    # annotations:
    #     openshift.io/description: ""
    #     openshift.io/display-name: appln-env-dev Dev
    # name: appln-env-dev
    # spec:
    # finalizers:
    # - openshift.io/origin
    # - kubernetes
    # status:
    # phase: Active

    ## Patch OSE3.9 DTA: appln-env-dev with index = ocpdta_index_01
    oc patch ns/appln-env-dev -p '{"metadata":{"annotations":{"collectord.io/index":"ocpdta_index_01"}}}'
    oc patch ns/appln-env-dev -p '{"metadata":{"annotations":{"collectord.io/logs-output":"splunk"}}}'

}

main() {

}

main
