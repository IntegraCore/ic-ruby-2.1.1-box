# A Virtual Ubuntu Machine for Ruby on Rails Core Development

## Introduction

**Please note this VM is not designed for Rails application development, only Rails core development.**

This project automates the setup of a development environment for working on Ruby on Rails itself. Use this virtual machine to work on a pull request with everything ready to hack and run the test suites.

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)

* Follow the [Confluence Installation Guide](https://integracore.atlassian.net/wiki/pages/viewpage.action?pageId=30310402) for a complete installation overview.

## How To Build The Virtual Machine

Building the virtual machine is this easy:

    host $ git clone https://github.com/IntegraCore/ic-ruby-2.1.1-box.git
    host $ cd ic-ruby-2.1.1-box
    host $ vagrant up

That's it.

After the installation has finished, you can access the virtual machine with

    host $ vagrant ssh
    Welcome to Ubuntu 14.04.1 LTS (GNU/Linux 3.13.0-36-generic i686)
    ...
    `vagrant@ic-ruby-2.1.1-box:~$`

Port 3000 in the host computer is forwarded to port 3000 in the virtual machine. Thus, applications running in the virtual machine can be accessed via localhost:3000 in the host computer.

## What's In The Box

* Development tools

* Git

* Ruby 2.1

* Bundler

* SQLite3, MySQL, and Postgres

* Databases and users needed to run the Active Record test suite

* System dependencies for nokogiri, sqlite3, mysql, mysql2, and pg

* Memcached

* Redis

* RabbitMQ

* An ExecJS runtime

## Recommended Workflow

The recommended workflow is

* edit in the host computer (with sublime, atom, etc) and

* work, test and run code within the virtual machine (via the command line).

Just clone your Rails fork into the ic-ruby-2.1.1-box directory on the host computer:

    host $ ls
    README.md   Vagrantfile puppet
    host $ git clone git@github.com:<your username>/rails.git

Vagrant mounts that directory as _/vagrant_ within the virtual machine:

    vagrant@ic-ruby-2.1.1-box:~$ ls /vagrant
    puppet  rails  README.md  Vagrantfile

Install gem dependencies in there:

    vagrant@ic-ruby-2.1.1-box:~$ cd /vagrant/rails
    vagrant@ic-ruby-2.1.1-box:/vagrant/rails$ bundle

We are ready to go to edit in the host, and test in the virtual machine.

This workflow is convenient because in the host computer you normally have your editor of choice fine-tuned, Git configured, and SSH keys in place.

## Virtual Machine Management

When done just log out with `^D` and suspend the virtual machine

    host $ vagrant suspend

then, resume to hack again

    host $ vagrant resume

Run

    host $ vagrant halt

to shutdown the virtual machine, and

    host $ vagrant up

to boot it again.

You can find out the state of a virtual machine anytime by invoking

    host $ vagrant status

Finally, to completely wipe the virtual machine from the disk **destroying all its contents**:

    host $ vagrant destroy # DANGER: all is gone

Please check the [Vagrant documentation](http://docs.vagrantup.com/v2/) for more information on Vagrant.

## Faster Rails test suites

The default mechanism for sharing folders is convenient and works out the box in
all Vagrant versions, but there are a couple of alternatives that are more
performant.

### rsync

Vagrant 1.5 implements a [sharing mechanism based on rsync](https://www.vagrantup.com/blog/feature-preview-vagrant-1-5-rsync.html)
that dramatically improves read/write because files are actually stored in the
guest. Just throw

    config.vm.synced_folder '.', '/vagrant', type: 'rsync'

to the _Vagrantfile_ and either rsync manually with

    vagrant rsync

or run

    vagrant rsync-auto

for automatic syncs. See the post linked above for details.

### NFS

If you're using Mac OS X or Linux you can increase the speed of Rails test suites with Vagrant's NFS synced folders.

With a NFS server installed (already installed on Mac OS X), add the following to the Vagrantfile:

    config.vm.synced_folder '.', '/vagrant', type: 'nfs'
    config.vm.network 'private_network', ip: '192.168.50.4' # ensure this is available

Then

    host $ vagrant up

Please check the Vagrant documentation on [NFS synced folders](http://docs.vagrantup.com/v2/synced-folders/nfs.html) for more information.

## License

Released under the MIT License, Copyright (c) 2012–<i>ω</i> Xavier Noria.
=======
# ruby-2.1.1-box
A simple Ubuntu environment for Ruby Development
>>>>>>> aba4ded8c4892f86fc8c04d48a2f5a4ec13f594e
