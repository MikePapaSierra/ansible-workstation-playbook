# ansible-workstation-playbook

Fully automated provisioning of the development environment based on Manjaro with i3.

DISCAIMER:
Note that this is still work in progress and some things can change and/or removed.

## Goals

Main goal of this project is to provide way to easly and automatically configure new workstation, server, virtual machine or docker container to heve persistent work environment across all machines.
As an option below actions should be available:

- [ ] Be able to configure GUI based environment
- [ ] Be able to configure CLI based environment
- [ ] Be able to upgrade OS to newest available version
- [ ] Be able to update single package to latest version by default

# Requirements

To run this playbook Ansible need to be installed on the operating system. Some kind of the Bash script that will install Ansible will be provided - please look to the Roadmap section.

Currently one Ansible Galaxy role is required to sucessfully run this playbook:
- [kewlfft.aur](https://github.com/kewlfft/ansible-aur)

All required roles had been addedd to the ``requirements.yml`` file and can be easly instaled by running command ``ansible-galaxy install -r requirements.yml`` before first run of the ``ansible-playbook ...`` command.

### Operating system

Projects was started with Manjaro Linux as operating system in mind, however usage ``ansible.builtin.package`` module should allow to install packages supported on another Linux distributions such Ubuntu or Fedora, but that wasn't proven yet.

### System upgrade

It's possible to upgrade operating system using this Ansible playbook by executing below command:
``ansible-playbook playbook.yml -l localhost -t osUpgrade ``
It's also possible to upgrade single package due to fact that in file ``group_vars/all`` as variable ``pkg_state`` latest is specyfied by default and each application is tagged.
``ansible-playbook playbook.yml -l localhost -t [app_name]``
If you would like to only ensure that packages are present just run this command:
``ansible-playbook playbook.yml -l localhoskt --extra-vars "pkg_state=present"``

## Setup

Currently manual installation of the Ansible is required, but in the near future Bash script will be provided to automate this task.
You can install Ansible using command ``pamac install ansible ansible-core`` or ``pacman -Syyu ansible ansible-core``.

## Usage

Provisioning of the clean workstation:

``ansible-playbook playbook.yml -l localhost``

Update of the operating system:

``ansible-playbook playbook.yml -l localhost -t osUpgrade``

Update of the single package:

``ansible-playbook playbook.yml -l localhost -t [app_name] --extra-vars "pkg_state=latest"``

## Testing

Currently tests environments aren't available, please folow roadmap.

## Known Issues

Not known.

## Roadmap
- [ ] Create Docker image to provide ability to easly test CLI based applications 
- [ ] Create VirtualBox based Vagrant box
- [ ] Create libvirt/qemu based Vagrant box
- [ ] Create Vagrant file that will allow to easly test GUI based applications
- [ ] Create Bash script that will install Ansible as pre-requisite 
- [ ] Task to add SSH keys encrypted by Ansible Vault to the configuration - this will allow for automatic provisioning
- [ ] Task to install VirtualBox kernel module in case when vm on Windows is used for tests or as a workstation
- [ ] Ensure that user account creation will not override data in home directory
- [ ] Ensure that user is using Fish as defult shell
- [ ] Task for installation of the oh-my-fish
- [ ] Task for PIP packages installation
- [ ] Task for installation of the npm
- [ ] Install commitzen (https://github.com/commitizen/cz-cli)
- [ ] Task for installation of the nitrogen
- [ ] Task for installation of the Gnome
- [ ] Finish task with installation and configuration of i3
- [ ] Figure out how to install and configure DraculaPro color theme for Neovim
    1. Vim theme need to be put as an private repository
    2. Repository should be placed in the ``~/.local/share/nvim/site/pack/themes/start/dracula_pro`` directory
    3. dos2unix needs to be installed
    4. ``find . -type f -exec dos2unix {} \;`` command needs to be executed on dracula_pro directory
- [ ] Task for KiCAD installation
- [ ] Task for Bash configuration
- [ ] Task for Arduino IDE installation
- [ ] Ensure that Ansible is present to be able run playbook
- [ ] Task for Tfsec installation
- [ ] Task for Checkov installation
- [ ] Task to create folder directiry structure in home folder
- [ ] Task to install Kubespray
- [ ] Task to install Kind
- [ ] Task to install OBS
- [ ] Task to install Darktable
- [ ] Task to install Kdenlive
- [ ] Task to install Dust
- [ ] Task to install i3Blocks
- [ ] Extend that to Ubuntu based OS (provide Vagrant box and file; prepare Docker image)
- [X] Task to install and comfigure TaskWarrior
- [ ] Balena-etcher install task does not work
- [ ] Add support for WSL/WSL2

## License

Under [MIT License](/LICENSE.md).

## Credits

Creating this Ansible playbook I was heavly inspired by:

- [ThePrimeagen](https://github.com/ThePrimeagen) course [Developer Productivity](https://frontendmasters.com/courses/developer-productivity/) on [FrontendMasters](https://frontendmasters.com)
- [TheAltF4](https://github.com/ALT-F4-LLC) [dotfiles](https://github.com/ALT-F4-LLC/dotfiles) repository and [YouTube video](https://www.youtube.com/watch?v=V_Cj_p6se3k)
- [manjaro-playbook](https://github.com/PauloPortugal/manjaro-playbook/tree/main) by [PauloPortugal](https://github.com/PauloPortugal)
