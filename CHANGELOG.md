# Changelog

This is the list of changes to Bootware between each release. For full details,
see the commit logs. The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project
adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.5.0 - 2023-01-30

### Added

- Debug flags for shell scripts.
- Flag to start execution at a role.
- GDU role.
- History deletion key bindings.
- Suse support for several roles.

### Changed

- Refactor architecture variables.
- Split system role into essential and update roles.
- TLDR role to use Tealdeer.

### Fixed

- Delta installation on Alpine.

### Removed

- Julia, Ruby, Snap, Virtualbox, Zola, and Zoxide roles.

## 0.4.1 - 2023-01-08

### Added

- GDB enhanced features installation.
- Kubeshark, Restic, Termshark, and Wireshark roles.
- PNPM shell integration.

### Changed

- Beekeeper from AppImage to Flatpak installation.
- Moved Libvirt, Vagrant and Vault roles to extras tag.
- Switched Lazygit role to GitUI.

### Fixed

- Go paths for CLI tools.
- Minimized GitHub API usage to avoid rate limits.
- PowerShell version 7 directory colors.
- Zellij integration for Alacritty during SSH sessions.

## 0.4.0 - 2022-07-13

### Added

- Kind, Helix, and Obsidian roles.
- SSH auto completion for Windows.
- Windows Defender Firewall rules.

## Changed

- Changed Beekeeper install from Snap to AppImage package.
- Default Unix editor to Helix.
- Improved Fzf shell integration.
- Moved Avro, Java, Julia, Parquet, Ruby and Virtualbox roles from default to
  extras list.

### Fixed

- Ansible collection installations are now shown to user.
- Automation for WSL installation.
- Node installation for FreeBSD.
- Mkcert dependencies for Linux.
- Sudoers roles for FreeBSD.
- Windows system path management for installations.

### Removed

- Desktop tag from Snap role.
- GistPad, LiveShare, and TabNine from default VSCode extensions.

## 0.3.6 - 2022-04-26

### Added

- All Ansible arguments to bootstrap subcommand.
- Age, Croc, Datree, Direnv, Duf, Helm, Helmfile, Htmlq, Kubectl, K9s,
  Lazydocker, Lazygit, Sops, Xh, Yq, and Zoxide roles.
- WSL tag for selecting roles.

### Changed

- Git pager to Delta.
- GitHub installation links.
- Ruby role to use standard installer instead of RVM.
- Split Bash subtasks into separate roles.
- Split Docker Compose installation separate role.

### Fixed

- Avoid unnecessary tasks for meta dependencies.
- Outdated Scoop package names.
- Update Starship installation command to match upstream change.
- VSCode settings file location for Scoop updates.
- Windows build tools versions.
- Windows Terminal settings file location for Microsoft Store installation.

### Removed

- Emacs and OTS role.
- Hyper terminal plugins that are broken on Windows.
- Libvirt support for Windows.
- Support for multiple Ruby versions.

## 0.3.5 - 2021-12-19

### Added

- Alpine support.
- Cuda and Nvidia Docker installations.
- Deno autocompletion support for Windows.
- Environment variable documenation.
- Flag --debug to set Ansible task debugger.
- Java, Julia, Parquet, Vagrant, Virtualbox, and Xsv roles.

### Changed

- Virtualization roles are no longer part of the server tag.

### Fixed

- Byte order marker for configuration files generated on Windows.
- USQL libicu depenency for Fedora.

## 0.3.4 - 2021-10-20

### Added

- Ability to choose Bootware branch for automatic WSL installation.
- Deno support for Apple ARM64.
- Beekeeper, Dust, Emacs, Etcher, FFSend, FzF, Hyperfine, Lua, Navi, OTS, Procs,
  RClone, Ruby and Scc, Zellij roles.
- GitHub CLI installation.
- History and menu autocompletion to PowerShell.
- Neosolarized and Packer installations for Neovim.
- Several PowerShell autocompletion modules.
- Software installation roles table in the documentation website.
- Support for more operating systems on Mongo Shell.
- Uninstall command.

### Changed

- Merged Bash, Bats, and Shfmt roles.
- Passwordless sudo setting for only current user.
- VSCode keybindings for switching between terminal tabs.
- Windows connections from WinRM to SSH.

### Fixed

- Commmand assertions to occur after argument parsing.

### Removed

- Desktop background picture automation.
- Xonsh role.

## 0.3.3 - 2021-08-06

### Added

- Avro, DBeaver, GitHub, GitLab, Glow, Hadolint, HDF5, Helm, Kubectl, SD, and
  Usql roles.
- Support for installing user defined Go applications.

### Changed

- Disabled pagination for Bat.
- Set EDITOR environment variable to Neovim.
- Switched to binary installer for FD.

### Fixed

- Removed unnecessary HTTP requests to formulae.brew.sh for MacOS.
- Reduced repeated roles with conditional depedencies.

### Removed

- Legacy Node and Python default versions.
- Postgres SQL clients.

## 0.3.2 - 2021-07-11

### Added

- Ansible check command line flag.
- Arm Linux support.
- Bass package manager for Fish.
- Digitial Ocean Bash and Fish completion.
- Fish completion script.
- Linux Snap and AppImage support.
- VSCode keybindings to change terminal tabs.
- VSCode YAML extension.

### Changed

- Default background image.
- Digital Ocean role name.
- Permissions to be more restrictive for user files.

### Fixed

- FD installation for Pop OS.
- GCloud Bash and Fish completion.
- Go root directory for MacOS.

### Removed

- Associated Docker images.
- VSCode bookmarks extension.

## 0.3.1 - 2021-04-26

### Added

- Cursor settings for MacOS.
- Direct WSL bootstrapping from PowerShell.
- Early XFCE desktop support.
- Error messaging for incorrect subcommands.
- Fuzz testing for Ansible roles.
- GCloud installation for Arch and Fedora.
- Windows terminal settings.
- Yay AUR helper for Arch.

### Changed

- Generates default configuration file instead of throwing an error if missing.

### Fixed

- Python and VSCode installations for Arch.
- System path for Apple Silicon binaries.

## 0.3.0 - 2021-04-02

### Added

- Caffeine installation role.
- Chocolatey package support for Windows.
- Experimental bootstrapping via WinRM for remote Windows hosts.
- Experimental WSL boostrapping for Windows.
- GNOME desktop UI customizations.
- Pop Shell extension for all GNOME desktops.
- Separate Debian and Ubuntu testing.

### Changed

- Made setup depenency checking more flexible.
- Upgraded Ansible version for Debian.
- Upgraded Docker installation version.

### Fixed

- Changelog notes for GitHub releases.
- Command line help for Windows.
- Debian base support for several packages.
- Generate of empty configuration files for Windows.
- Missing Pip system installation for Fedora.
- Passwordless sudo configuration for MacOS.
- Pipx package upgrades for updated Python interperter.
- Scoop bucket additions for Windows.

## 0.2.3 - 2021-03-15

### Added

- Changelog updates for GitHub releases.
- Commands in man page.

## 0.2.2 - 2021-03-12

### Fixed

- Debian packaging in GitHub releases.

## 0.2.1 - 2021-03-12

### Added

- Support for Apple M1 computers.

## 0.2.0 - 2021-02-10

### Added

- Several software installations for Fedora ibutions.

### Fixed

- Alacritty installation on Fedora.
