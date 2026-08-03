# dotfiles

Configs for editorconfig, tmux, and NeoVim. Managed with GNU Stow.

## Install on a new machine

```sh
git clone <this-repo> ~/src/dotfiles
cd ~/src/dotfiles
stow editorconfig tmux nvim
```

Stow reads the target (`$HOME`) from `.stowrc`.

NeoVim installs its own plugins and language servers on first start.

## Notes

- The tmux status color `#272c2e` matches a terminal background of
  `#2E3436`. Adjust it on machines with a different terminal theme.
