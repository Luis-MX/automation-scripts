sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates
sudo apt-get install -y postfix
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
echo -n 'Escribe la direccion en que se accedera a GitLab:'
read url
sudo EXTERNAL_URL="http://$url" apt-get install gitlab-ee

