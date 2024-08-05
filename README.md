# Jenkins Kubernetes Multi-Cloud Deployment

This repository provides instructions on how to use Jenkins to deploy agents on multiple Kubernetes clouds.

## Docs
- [Install kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [Install Microk8s](https://ubuntu.com/tutorials/install-a-local-kubernetes-with-microk8)
- [Run Jenkins in Docker Container](https://github.com/jenkinsci/docker/blob/master/README.md)
  [Reverse Proxy - IP Tables](https://www.jenkins.io/doc/book/system-administration/reverse-proxy-configuration-with-jenkins/reverse-proxy-configuration-iptables/)
- [kubernetes/cli-plugin](https://github.com/jenkinsci/kubernetes-cli-plugin)
- [Kubernetes plugin for Jenkins](https://plugins.jenkins.io/kubernetes/#plugin-content-kubernetes-plugin-for-jenkins)

## Prerequisites
- Azure Subscription with Administrator Access
- Azure CLI on client machine to execute commands

## Usage
### Execute deployment
- Open Windows Terminal and login to Azure environment
- In repository, navigate to [jenkins-k8s-multi-cloud/src/deploy.sh](https://github.com/chwil_microsoft/jenkins-k8s-multi-cloud/tree/main/src/deploy.sh)
  - Set execute mode: `chmod +x deploy.sh`
  - Deploy resources: ./deploy.sh

### Install Software on VM
- After deployment completes, you will be logged into the Azure VM
- Deploy software
  - Set execute mode: `chmod deploy-software.sh`
  - Deploy software on VM: `./deploy-software.sh`

## Troubleshooting

If you encounter any issues during the setup or usage of this solution, refer to the [Troubleshooting Guide](./TROUBLESHOOTING.md) for common problems and their solutions.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](./LICENSE).