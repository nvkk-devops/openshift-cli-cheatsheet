identify_configmaps(){
    # for i in $(seq 1 $END); do echo $i; done

    for i in `oc get configmap --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep "bc-"` 
    do 
        echo $i; 
        #oc delete configmap/${i}
    done

}

delete_completed_pod(){

    # kubectl get pods --field-selector=status.phase!=Running --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'

    for i in `oc get po --field-selector=status.phase!=Running --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'` 
    do 
        echo $i; 
        oc delete po/${i}
    done
}

delete_desired_zero_replicas(){
    # kubectl get pods --field-selector=status.phase!=Running --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'

    for i in `oc get rc --field-selector=status.replicas==0 --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'` 
    do 
        echo $i; 
        oc delete rc/${i}
    done
}

main() {
    delete_bc_configmaps

    delete_completed_pod

    delete_desired_zero_replicas
}

main