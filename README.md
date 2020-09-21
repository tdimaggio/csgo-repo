Puppet bootstrap for Cloud-Init Instances

Part of AWS bootstrap is installing the puppet-common package, first thing is to copy the default /etc/puppet directory to /etc/puppet.orig.  This way git can copy data to /etc/puppy.  Git will only write to an empty directory.

	#move default /etc/puppet directory
	mv /etc/puppet /etc/puppet.orig
    #git clone repo to /etc/puppet/
	git clone GITLAB_REPO /etc/puppet

Current GitHub aws.git repo contains 2 folders, “manifests” and “files” as well as the *_bootstrap.txt file.

The *_bootstrap.txt file is copy and pasted into Advanced section during provisioning.  

The bootstrap:
    - Runs an apt-get update
    - Installs git, puppet-common, and dos2unix (optional)
    - Moves the default /etc/puppet to /etc/puppet.orig
    - Git clones the aws.git repo to /etc/puppet
    - Runs puppet

The run-puppet.pp manifest does 2 things:
    - Copies the run-puppet.sh file located in the files folder to the /usr/local/bin folder
    - Creates a cron job to execute run-puppet.sh

The run-puppet.sh file does the following:
    - Executes a git pull to the /etc/puppet folder
    - Runs “puppet apply” against all manifests in /etc/puppet/manifests

If new .pp manifests are added to the manifests folder in repo when cron runs /usr/local/bin/run-puppet.sh it will update /etc/puppet/manifests on AWS instance via git pull and run puppet apply.
