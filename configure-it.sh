if [[ "" = "$1" || "" = "$2" || "" = "$3" ]]; then
    echo ""
    echo "Error: This command need parameters to run!"
    echo ""
    echo "Command sintax:"
    echo "./configure-it.sh SIGLA TOPIC_NAME ELASTIC_INDEX"
    echo ""
    echo "Per example, given an app with the id ABC"
    echo "ex: ./configure-it.sh app-abc TPC_ABC_METRICS idx_abc_"
    echo ""
else
    oc new-project monitoring
    oc project monitoring
    oc create -f configmap-logstash-env.yaml
    PARAM_APPLICATION=$1
    PARAM_TOPIC_NAME=$2
    PARAM_ELASTIC_INDEX=$3
    cat kafka-logstash.yaml | sed 's@PARAM_APPLICATION@'"${PARAM_APPLICATION}"'@g'  | sed 's@PARAM_TOPIC_NAME@'"${PARAM_TOPIC_NAME}"'@g'  | sed 's@PARAM_ELASTIC_INDEX@'"${PARAM_ELASTIC_INDEX}"'@g' | oc create -f -
fi
