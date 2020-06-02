# ref : https://code.visualstudio.com/docs/containers/ssh

az login
az account set -s "azure demo"
az aks get-credentials --resource-group jenkins-krs-rg --name k8s


docker context ls
docker context inspect default

docker context create aks \
  --default-stack-orchestrator=kubernetes \
  --kubernetes config-file=/home/labuser/.kube/config \
  --docker host=ssh://labuser@aks

docker context ls
docker context inspect aks

docker context create remote \
  --default-stack-orchestrator=swarm \
  --docker host=ssh://labuser@ubuntu1804

docker context ls
docker context inspect remote
