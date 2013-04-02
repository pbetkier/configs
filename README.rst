My configuration for bash, git, vim and other programming tools.

Installation
~~~~~~~~~~~~
Run ``apply.sh`` script to install the config::

  $ apply.sh
  Creating backup ...
  Appending source entry to .bashrc ...
  Creating symlinks ...
  Done!

This will copy the previous configuration files to the ``backups`` directory, add a source entry with additional configuration to ``.bashrc`` file and finally replace the previous configuration files with links referring to configuration files in this repository.
