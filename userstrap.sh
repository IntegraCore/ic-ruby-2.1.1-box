function rvm {
		echo getting RVM
		gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
		vagsudo -u vagrant --login gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
		sudo -u vagrant --login curl -L https://get.rvm.io | bash -s stable

		echo installing 2.1.1
		[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
		
		sudo -u vagrant --login rvm install 2.1.1
		sudo -u vagrant --login gem install rails --no-ri --no-rdoc
}

if [ ! -d ~/.rvm ]
	then
		rvm
fi
if [ -d ~/.rvm ]
	then
		echo "RVM already installed"
fi
function configGitSSH {
		mkdir ~/.ssh
		cp /vagrant/ssh_config ~/.ssh/config
		ssh-keygen -P '' -f ~/.ssh/id_rsa
		ssh-keyscan -H cerebro >> ~/.ssh/known_hosts
		ssh-keyscan -H tron >> ~/.ssh/known_hosts
		ssh-keyscan -H richards >> ~/.ssh/known_hosts
		sshpass -p 'honesty~1' ssh-copy-id cerebro
		sshpass -p 'INTEGRITY+fun' ssh-copy-id tron
		sshpass -p 'honesty~1' ssh-copy-id richards
		touch ~/.ssh/ran_config
		sed -i '1iforce_color_prompt=yes' ~/.bashrc
		cp /vagrant/first_run.rb ~/
		cat /vagrant/first_run.sh >> ~/.bash_profile
}
if [ ! -e ~/.ssh/ran_config ]
	then
		configGitSSH
fi
if [ -e ~/.ssh/ran_config ]
	then
		echo "already configed"
fi
echo 'You Know it ... all set up!!'
