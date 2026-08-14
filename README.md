# dotfiles

Configs for editorconfig, tmux, NeoVim, git, and Claude Code. Managed with
GNU Stow in `--dotfiles` mode: `dot-config` in the repo becomes `.config`
in `$HOME`, and `dot-claude` becomes `.claude`.

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

- The `claude` package only tracks `CLAUDE.md` and `settings.json`. The rest
  of `~/.claude` (credentials, session history, caches, projects) is runtime
  state, not configuration, and stays untracked.

- The tmux status color `#272c2e` matches a terminal background of
  `#2E3436`. Adjust it on machines with a different terminal theme.
- Old i3, kitty, alacritty, and xbindkeys packages live in git history
  (removed 2026-08-03).
