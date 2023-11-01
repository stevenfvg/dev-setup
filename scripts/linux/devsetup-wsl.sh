#! /bin/bash

# Install text editors Vim
sudo apt -y install vim

# Install node.js and npm 
sudo apt -y install nodejs
sudo apt -y install npm
# Upgrade Node.js to LTS version
sudo npm install -g n
sudo n install lts latest

# Add npm packages
sudo npm install -g nodemon
sudo npm install -g @commitlint/cli @commitlint/config-conventional

# Install the latest version of Python
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt -y install python3.11
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.11 
sudo apt -y install python3.11-dev python3.11-venv python3.11-distutils python3.11-gdbm python3.11-tk python3.11-lib2to3

#
# Installing Git
#
sudo apt -y install git-all
# Add global settings
echo "Enter your Git user name: "
read -r git_username
git config --global user.name "$git_username"
echo "Enter your Git email: "
read -r git_email
git config --global user.email "$git_email"
git config --global core.editor vim
git config --global init.defaultBranch main
# SSH key configuration for GitHub
if [ ! -f "/home/${USER}/.ssh/id_ed25519" ]; then
  ssh-keygen -t ed25519 -C "$git_email"
  eval "$(ssh-agent -s)"
  ssh-add "/home/${USER}/.ssh/id_ed25519"

  echo "Your public SSH key is:"
  cat "/home/${USER}/.ssh/id_ed25519.pub"
  read -rp "Press Enter to continue..."
fi

echo -e "\e[32mProcess completed satisfactorily..\e[0m"