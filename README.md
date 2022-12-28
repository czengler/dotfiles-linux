# Linux dotfiles

A simple Linux dotfile selection for deployment on my `apt`-based Linux servers and virtual machines.  This is not my personal development setup, but a stripped down version to make life more bearable.  It includes

- ZSH configuration including [auto suggestions](https://github.com/zsh-users/zsh-autosuggestions) and [fast syntax highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- [Neovim](https://github.com/neovim/neovim) configuration with a subset of my development config (no LSP, no Snippets, no Completion)
- [LF](https://github.com/gokcehan/lf) configuration
- Git configuration

These dotfiles assume that the system is setup according to my [ansible playbook](https://github.com/czengler/ansible-linux).
