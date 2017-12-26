Boss Box
========

A modern, easy to configure, WordPress ready Vagrant box, perfect for local development.

Credits
=======

This project was inspired by [Scotch Box](https://box.scotch.io/) and built using the [Scotch Box Pro](https://box.scotch.io/pro/) build scripts by [Nicholas Cerminara](https://twitter.com/whatnicktweets). If you like this project, please also consider supporting Nick by purchasing a Scotch Box Pro license at a mere $15.

What's included?
================

Base Web Server Stack (LAMP)
----------------------------

1. Ubuntu 16.04 LTS
1. Nginx
1. MySQL 5.7
1. PHP 7.0

Utilities
---------

1. Git
1. Vim
1. Imagemagick
1. Curl

Additional Software
-------------------

1. [PHPUnit](PHPUnit)
1. [PHPMyadmin](https://www.phpmyadmin.net/)
1. [Xdebug](https://xdebug.org/)
1. [Composer](https://getcomposer.org/)
1. [WP-CLI](http://wp-cli.org/)
1. [Ngrok](https://ngrok.com/)
1. [Node.js](https://nodejs.org/en/)
1. [Memcached](https://memcached.org/)
1. [Go](https://golang.org/)
1. [MailHog](https://github.com/mailhog/MailHog)

Configuration options
=====================

1. Ability to enable/disable update checks (when working offline)
1. Edit sitename, IP address, database name, and MySQL root password
1. Set Virtual Machine memory size

Required Software
=================

Make sure you have the following software installed

1. [Vagrant](https://www.vagrantup.com/) 
1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Recommended Software
====================

[Vagrant Hosts Updater](https://github.com/cogitatio/vagrant-hostsupdater)

This plugin will allow your system to manage writing to the hosts file automatically, instead of having to edit /etc/hosts each time.
    
Initial Setup (Linux/OSx)
=========================
    
From a terminal window:    
    
Clone the github repo

```bash
git clone git@github.com:jonathanbossenger/boss-box-lemp.git
```

Switch to the boss-box-lamp directory

```bash
cd boss-box-lamp
```

Copy the 'vagrant' folder to your project web root

```bash
cp -r vagrant/ /path/to/myproject/webroot/vagrant/
```

Switch to the project vagrant directory

```bash
cd ~/path/to/myproject/webroot/vagrant/
```

Edit the settings.yaml file in the newly copied /path/to/myproject/webroot/vagrant/ directory as required.

Start BossBox        
        
```bash
vagrant up
```

Basic Vagrant Usage
===================

```bash
vagrant up
```
Start the virtual machine

```bash
vagrant halt
```

Stop the virtual machine

```bash
vagrant ssh
```

Login to the virtual machine via SSH


Access
======

You can access the local site by either the IP address or sitename specified in your settings.yaml (if it is set in your /etc/hosts file)

```
http://192.168.33.10 or http://sitename
```

**PHPMyAdmin**

```
http://192.168.33.10/phpmyadmin or http://sitename/phpmyadmin
```

**MailHog**

```
http://192.168.33.10:8025 or http://sitename:8025
```

Using Xdebug with PHPStorm
==========================

This box has Xdebug installed and is setup to make use of the [Zero-configuration Debugging with PhpStorm](http://www.jetbrains.com/phpstorm/documentation/phpstorm-video-tutorials.html#10)

1. Either setup the [PHPStorm Bookmarklets](https://www.jetbrains.com/phpstorm/marklets/) or install the [Xdebug helper for Chrome](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc?hl=en)
1. Start debugging from the browser using whichever option you've chosen above
1. Make sure PHPStorm is listening for incoming debug connections (Run > Start listening for PHP debug connections)
1. Set breakpoints in your PHPStorm code window
1. Refresh your project url

On the first run, PHPStorm will ask you to map the debugger to a local path, you should be able to accept the defaults.


Enjoy!