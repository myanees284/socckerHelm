# socckerHelm -- This project is similar to <a href="https://github.com/myanees284/KuberHelms">KuberHelms project</a>  where the deployment is done using <a href="https://helm.sh">HELM charts</a>, the Kubernetes package manager.

Sample Application downloaded and made changes to fit my need  - Node JS app connected to AWS MySQL DB, where soccer player names are added and removed.
https://dev.to/achowba/build-a-simple-app-using-node-js-and-mysql-19me

1)**Dockerfile** - pulls node alpine OS,copies the source code, installs the dependencies and starts the application on port 2000(locally)<br>
2)**Run_SockkerHelm.sh** - <br>
  2.1) logs into the docker repository and pushes the image <br>
  2.2) logs into the IBM BlueMix, pulls the image from docker repository and deploys into the cluster using HELM(package   manager) <br>
  2.3) If the deployment with name **"you"** is not available, the deployment is created with "v<some numbers>"(this is unique tag name) which is a version number <br>
  2.4) If the deployment with name **"you"** already exists, the existing deployment is updated with the new code changes with no downtime<br>

Application is accessible after the deployment into the Kubernetes cluster >http://hostname:port
  
  
The logic(Run_SockkerHelm.sh) mentioned for this sample deployment can be enhanced for actual projects.

**prerequisite**
1) Docker and IBM Cloud account
2) Docker and IBM Cloud CLI
3) Kubernetes cluster in cloud(mycluster)
4) MySQL database locally or in cloud(check sockerapp/app.js file in line number 15 to 18)




