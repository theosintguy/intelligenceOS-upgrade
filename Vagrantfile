# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    # Customize the amount of memory on the VM:
    #vb.memory = "1024"
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.galaxy_role_file = "requirements.yml"
  end
end
