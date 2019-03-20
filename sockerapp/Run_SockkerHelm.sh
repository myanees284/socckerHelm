#!/bin/bash
imageName="myanees/testla"
timestamp=$(date +%s)
tagVal=v$timestamp
imagever=$imageName:v$timestamp
APIKEY=${clogin}
KUBECONFIG=${kubeconfig}
DLOGIN=${dlogin}
DPASS=${dpass}

docker login --username $DLOGIN --password $DPASS
docker build -t $imagever .
docker push $imagever
ibmcloud login --apikey $APIKEY -r eu-de
ibmcloud ks cluster-config mycluster
export $KUBECONFIG
##export DEPNAME=$(kubectl get deployment -o json | jq '.items[0].metadata.name')
export DEPNAME=$(kubectl get deployment --selector=$sel --output=jsonpath={.items..metadata.name})
echo $DEPNAME
if [[ $DEPNAME == *"you"* ]]
then
  echo "Updating container IMAGE"
  helm package helmapp1
  helm upgrade you helmapp1-0.1.0.tgz --set=image.tag=$tagVal
else
  echo "Creating HELM PACKAGE"
  helm package helmapp1
  helm install helmapp1-0.1.0.tgz --name=you
fi
echo ******Deployment Completed*********
export PORT=$(kubectl get svc you-helmapp1 -o go-template='{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}')
export HOST=$(ibmcloud ks workers mycluster --json | jq '.[0].publicIP')
echo Application url is $HOST:$PORT
