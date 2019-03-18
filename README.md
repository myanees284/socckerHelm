# socckerHelm

socckerHelm -- This project is similar KuberHelms project where the deployment is done using HELM charts, the Kubernetes package manager.
Sample Application downloaded and made changes to fit my need  - Node JS app connected to AWS MySQL DB, where soccer player names are added and removed.
https://dev.to/achowba/build-a-simple-app-using-node-js-and-mysql-19me

1)Dockerfile - builds the source code using maven, runs the application on port 2000(locally) 
2)Run_SockkerHelm.sh: 
  2.1) logs into the docker repository and pushes the image 
  2.2) logs into the IBMcloud, pull the image and deploy into the cluster using HELM 
  2.3) If the deployment with name "you" is not available, a new deployment is created with "v<some numbers>"(this is unique tag name) image tag 
  2.4) If the deployment with name "you" already exists, the existing deployment is updated with the new code changes

Application is accesible on http://hostname:30100/
