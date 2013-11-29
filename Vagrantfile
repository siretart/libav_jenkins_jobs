# -*- mode: ruby -*-

$script = <<SCRIPT
export DEBCONF_FRONTEND=noninteractive

wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list

apt-get update -qq
apt-get install -y vim emacs23-nox curl python-software-properties build-essential
apt-get install -y jenkins
apt-get install -y git libyaml-dev
apt-get install -y python-virtualenv

SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provision :shell, :inline => $script
  # forward docker ports
  [80, 443, 8080].each do |port|
    config.vm.network :forwarded_port, :host => 3000 + port, :guest => port
  end
end
