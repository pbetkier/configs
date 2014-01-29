My configuration for bash, git, vim and other programming tools. I use it for a quick start when developing on a new machine.

You can either view it and borrow the lines that you like or install this configuration overriding what you had earlier. Use at your own risk ;)

Installation
~~~~~~~~~~~~
Clone and enter the repository::

  $ git clone https://bitbucket.org/pbetkier/configs.git
  $ cd configs/

Run ``install_config.sh`` script to install the config. **This will override your current configuration**::

  $ ./install_config.sh
  Creating backup ...
  Appending source entry to .bashrc ...
  Creating symlinks ...
  Done!

This will copy your previous configuration files to the ``backups`` directory, add a source entry with additional configuration to ``.bashrc`` file and finally replace your previous configuration files with links referring to configuration files in this repository.
