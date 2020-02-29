#install kubectl

sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# install linkerd
curl -sL https://run.linkerd.io/install | sh
   export PATH=$PATH:$HOME/.linkerd2/bin
   linkerd version
  linkerd check --pre
curl -sL https://run.linkerd.io/install | sh
 export PATH=$PATH:$HOME/.linkerd2/bin
linkerd version

sudo apt-get install wget unzip


# install terraform
sudo wget https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.21_linux_amd64.zip
sudo unzip ./ terraform_0.12.21_linux_amd64.zip –d /usr/local/bin

   git clone https://github.com/terraform-providers/terraform-provider-aws.git
   cd terraform-provider-aws/examples/eks-getting-started
   terraform init


# install iam-auth 
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
 chmod +x ./aws-iam-authenticator
 mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin
   echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
   aws-iam-authenticator help


#setup a cluster and monitor it 
   kubectl version
   terraform output config_map_aws_auth > configmap.yml
   kubectl apply -f configmap.yml
   kubectl get nodes -o wide
   linkerd check --pre
   linkerd install | kubectl apply -f -
   linkerd check
   kubectl -n linkerd get deploy
   linkerd dashboard &

