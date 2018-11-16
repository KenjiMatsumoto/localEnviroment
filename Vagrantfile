# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # centOS　already docker install
  config.vm.box = "ailispaw/barge"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.120.11.20"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # マウント設定
  config.vm.synced_folder "../localEnviroment", "/vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  # 2GBを利用するように設定
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # 起動時にshellを実行
  config.vm.provision "shell", inline: <<-SHELL
  #   yum -y update
      sudo /etc/init.d/docker restart
      sleep 1
      sudo mkdir -p /vagrant/share/postgres
      sudo chmod 777 /vagrant/share/postgres
      sudo mkdir -p /vagrant/share/mysql
      sudo chmod 777 /vagrant/share/mysql
      docker run -v /vagrant/share/postgres:/vagrant -v /vagrant/postgres:/vagrant/postgres --restart=always --name postgres -p 5432:5432 -d postgres:10-alpine
      docker run -v /vagrant/share/mysql:/vagrant -v /vagrant/mysql:/vagrant/mysql --restart=always --name mysql -e MYSQL_ROOT_PASSWORD=mysql -d mysql:8.0
      sleep 20
      # postgresのDB環境作成
      docker exec postgres /usr/local/bin/createdb -U postgres mydb_ps
      docker exec postgres /usr/local/bin/psql -U postgres -d mydb_ps -f /vagrant/postgres/createrole.sql
　　　　　　　　　　　　# mysqlのDB環境作成
      docker exec mysql /usr/local/bin/createdb -U mysql mydb_mq
      docker exec mysql /usr/local/bin/mysql -U mysql -d mydb_mq -f /vagrant/mysql/createrole.sql
  SHELL
end
