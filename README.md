# Development environment bootstrap 
Configuration files for the programming tools I use. Useful for a quick start when developing on a new machine.

## Installation
Clone the repository and run the installation script:
```
$ git clone https://github.com/pbetkier/configs
$ cd configs/
$ ./install_configs.sh
```

This will create symlinks to configuration files kept in ``configs`` directory. A copy of your previous configuration files is kept in ``backups`` directory.

### Install packages
You can also bootstrap your development environment by installing essential packages, like vim or git. Just run ``install_packages.sh``. Run ``install_all.sh`` to install both packages and configs.
