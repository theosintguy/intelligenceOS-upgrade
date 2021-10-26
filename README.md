# intelligenceOS

This repository contains an Ansible role (see `provision` directory) to upgrade an Arch Linux installation to intelligenceOS.

## How to

The provided role can be used in any setup that a regular Ansible role can be used.

The suggested way with the least effort is the following:

- Make sure you have `virtualbox` installed on your machine
- Make sure you have `vagrant` installed on your machine
- Make sure you have `python3` installed on your machine

- Make sure you have the following packages installed on your machine:
    - `virtualbox`
    - `vagrant`
    - `python3`
    - `direnv`
- Run `make venv` to create a python3 virtual environment and install all
  python dependencies inside it.
- Run `direnv allow` to load the environment variables from `.envrc` and
  thereby activating the virtualenv and adding its bin directory to $PATH (this
  can also be done manually but it's more comfortable this way :) )
- Run `vagrant up` to download the archlinux box from the Vagrant cloud, bring
  it up and start provisioning it with `playbook.yml` which calls the
  `provision` role. Note: This can take a long time to finish (During testing
  it took around 1.5 hours in a VM with 8 cpus and 16GB RAM)
- Profit (a window with the virtualbox VM should've appeared at some point)

## Testing

For testing the Ansible role follow the same steps above but instead of `vagrant up` run `molecule test` inside the `provision` directory.


## License

The project was released under the terms and conditions of the MIT License.
