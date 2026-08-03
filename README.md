# dotfiles

Configs for editorconfig, tmux, and NeoVim. Managed with GNU Stow
in `--dotfiles` mode: `dot-config` in the repo becomes `.config` in `$HOME`.

## Install on a new machine

```sh
git clone https://github.com/stykhomyrov/dotfiles.git ~/src/dotfiles
cd ~/src/dotfiles
make install        # stows every package
```

Or stow single packages (`.stowrc` sets the flags):

```sh
stow nvim tmux editorconfig
```

NeoVim installs its own plugins and language servers on first start.

## Notes

- The tmux status color `#272c2e` matches a terminal background of
  `#2E3436`. Adjust it on machines with a different terminal theme.
- Old i3, kitty, alacritty, and xbindkeys packages live in git history
  (removed 2026-08-03).
