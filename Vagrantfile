Vagrant.configure("2") do |config|
    config.vm.box = "debian/jessie64"
	config.vm.provision "shell", path: "script.sh"
   config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
   config.vm.synced_folder ".vagrant", "/vagrant"
	
end
