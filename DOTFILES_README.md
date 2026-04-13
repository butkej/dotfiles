# Dotfiles Reference — Joshua Butke

Personal reference for shell, editor, and terminal multiplexer config.
Last reviewed: 2026-04-13.

---

## File Map

| File | Purpose |
|---|---|
| `~/.zshrc` | Main shell config — plugins, aliases, env vars, PATH |
| `~/.custom_aliases` | Personal aliases (sourced by `.zshrc`) |
| `~/.zprofile` | Login-shell only: Homebrew env, VS Code PATH |
| `~/.vimrc` | Vim config — plugins, keybindings, appearance |
| `~/.tmux.conf` | Tmux config — prefix, splits, pane navigation |
| `~/.gitconfig` | Git identity, credential helpers, default branch |
| `~/.gitignore` | Global gitignore (DS_Store, pyc, venv, node_modules…) |
| `~/.fzf.zsh` | FZF shell integration (sourced by `.zshrc`) |

---

## Shell — `.zshrc` + `.custom_aliases`

**Framework:** oh-my-zsh (`~/.oh-my-zsh/`), theme: **Dracula**

### Plugins

| Plugin | What it does |
|---|---|
| `git` | Git aliases (`gst`, `gco`, `glog`, …). Run `alias \| grep git` to list all. |
| `zsh-autosuggestions` | Suggests commands as you type based on history. Accept with `→` arrow. Must be cloned into `~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/` manually. |
| `fzf` | Fuzzy finder keybindings in the shell (see FZF section below). |

### Key Aliases (from `.custom_aliases`)

| Alias | Expands to | Notes |
|---|---|---|
| `ll` | `ls -lhptG` | Long list, human sizes, sorted by time, color |
| `la` | `ls -lhpaG` | Same but includes hidden files |
| `b` | `cd ..` | Go up one directory |
| `q` | `exit` | Close shell |
| `v` | `vim` | Open vim |
| `grep` | `grep --color=auto` | Always colorise grep output |
| `work` | `cd ~/Developer/work/refined-lasers/` | Jump to work code |
| `data` | `cd ~/Developer/work/data/refined-lasers/` | Jump to work data |

### Environment Variables

| Variable | Value | Set in |
|---|---|---|
| `EDITOR` | `vim` | `.zshrc` |
| `ZSH` | `~/.oh-my-zsh` | `.zshrc` |
| `FZF_BASE` | `~/.fzf` | `.zshrc` |
| `HIST_STAMPS` | `yyyy-mm-dd` | `.zshrc` |
| `PATH` (brew) | `/opt/homebrew/...` | `.zprofile` (login shells) |
| `PATH` (code) | VS Code CLI | `.zprofile` (login shells) |

> **Note:** `.zprofile` only loads in login shells. In non-login shells (some terminal emulators, VS Code integrated terminal), `brew` and `code` may not be on PATH. Check with `echo $PATH`.

### Python / uv

`~/.local/bin/env` is sourced at the bottom of `.zshrc` — this activates the `uv` toolchain. To activate a project venv: `source .venv/bin/activate`.

---

## FZF — Fuzzy Finder

Installed from source at `~/.fzf/` (not Homebrew). Update by running:
```sh
cd ~/.fzf && git pull && ./install
```

### Key Bindings (active in zsh)

| Shortcut | Action |
|---|---|
| `Ctrl+T` | Fuzzy-find a file and insert its path at the cursor |
| `Ctrl+R` | Fuzzy search shell history |
| `Alt+C` | Fuzzy-find a directory and `cd` into it |

### Use with Vim

`:FZF` or just type `fzf` at the shell. Can be piped: `vim $(fzf)`.

---

## Vim — `.vimrc`

**Plugin manager:** [vim-plug](https://github.com/junegunn/vim-plug)
Auto-bootstraps itself on first launch (downloads `plug.vim` via curl).

### Installed Plugins

| Plugin | Purpose |
|---|---|
| `dracula/vim` | Dracula colorscheme |
| `itchyny/lightline.vim` | Lightweight statusline (replaces default mode display) |
| `christoomey/vim-tmux-navigator` | Seamless `Ctrl+H/J/K/L` navigation across vim splits and tmux panes |

To install/update plugins: `:PlugInstall` / `:PlugUpdate` / `:PlugClean`

### Key Bindings

| Keys | Mode | Action |
|---|---|---|
| `Space` | Normal | Toggle fold open/closed |
| `jk` | Insert | Exit insert mode (replaces `Esc`) |
| `F2` | Any | Toggle paste mode (prevents autoindent mangling when pasting) |
| `run` | Normal | Save and run current file with Python (`!clear;python %`) |
| `Ctrl+H/J/K/L` | Normal | Move between splits (also works across tmux panes) |

### Important Settings

| Setting | Value | Effect |
|---|---|---|
| `tabstop / shiftwidth / softtabstop` | 4 | 4-space tabs, expanded to spaces |
| `foldmethod` | `indent` | Folds based on indentation level (good for Python) |
| `foldlevel` | 99 | All folds open by default |
| `ignorecase` | on | Case-insensitive search |
| `number` | on | Line numbers |
| `splitbelow / splitright` | on | New splits open below/right (more natural) |
| `so=8` | 8 lines | Cursor stays 8 lines from top/bottom when scrolling |

### File Explorer (netrw — built-in)

Open with `:Explore` (or `:Ex`). Configured as a 20%-wide tree sidebar.
Navigate with arrows, `Enter` to open (in previous window), `-` to go up.

---

## Tmux — `.tmux.conf`

**Prefix:** `Ctrl+A` (also backtick `` ` `` as secondary prefix)

### Window & Session Management

| Keys | Action |
|---|---|
| `Prefix c` | New window (opens in current path) |
| `Prefix 0–9` | Switch to window N |
| `Prefix n / p` | Next / previous window |
| `Prefix x` | Kill current window/pane |
| `Prefix d` | Detach session (leaves it running) |
| `Prefix $` | Rename session |

Reattach later: `tmux attach` or `tmux a -t <session-name>`

### Pane Splitting

| Keys | Action |
|---|---|
| `Prefix \|` | Split vertically (side by side) |
| `Prefix -` | Split horizontally (top/bottom) |
| `Prefix z` | Zoom current pane to full window (toggle) |
| `Prefix }` | Rotate panes |

### Pane Navigation

| Keys | Action |
|---|---|
| `Ctrl+H/J/K/L` | Move between panes (vim-aware — also works inside vim splits) |

> This uses `christoomey/vim-tmux-navigator`. The same `Ctrl+H/J/K/L` works uniformly whether you're in a tmux pane or a vim split.

Windows start at index **1** (not 0).

---

## Git — `.gitconfig`

| Setting | Value |
|---|---|
| Default branch | `main` |
| Global gitignore | `~/.gitignore` |
| Credential manager | `git-credential-manager` (GCM) at `/usr/local/share/gcm-core/` |
| Azure DevOps | `useHttpPath = true` (required for per-repo tokens on Azure) |
| HuggingFace | `provider = generic` (for `huggingface-cli` / model hub access) |

The empty `helper =` line before GCM is intentional — it clears the macOS keychain default so GCM takes over cleanly.

---

## Dotfiles Management — yadm

Dotfiles are version-controlled with [yadm](https://yadm.io) and pushed to `github.com/butkej/dotfiles`.

### Day-to-day: after editing a dotfile

```sh
yadm add -u                     # stage all changes to already-tracked files
yadm add ~/.some_new_file       # or add a new file explicitly
yadm status                     # review what's staged
yadm commit -m "describe change"
yadm push
```

### Adding a new file to tracking

```sh
yadm add ~/.newfile
yadm commit -m "track newfile"
yadm push
```

### Updating the Brewfile (do this periodically or after installing new tools)

```sh
brew bundle dump --file=~/Brewfile --force
yadm add ~/Brewfile
yadm commit -m "update Brewfile"
yadm push
```

---

## New MacBook — Full Restore

Run these commands in order. Everything is restored in about 10 minutes (plus download time).

```sh
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install yadm
brew install yadm

# 3. Clone dotfiles — checks out all files into their correct locations in ~
yadm clone https://github.com/butkej/dotfiles.git

# 4. Reload shell config
source ~/.zshrc

# 5. Restore all Homebrew packages, casks, and VS Code extensions
brew bundle install --file=~/Brewfile
```

After step 3, all dotfiles (`.zshrc`, `.vimrc`, `.tmux.conf`, etc.) are in place.
After step 5, all tools and VS Code extensions are reinstalled.

**Remaining manual steps after restore:**
- Re-authenticate git credential manager: `git credential-manager configure` or just attempt a `git push` and follow the prompt
- Re-authenticate HuggingFace: `huggingface-cli login`
- Clone SSH keys from a backup (never store these in the dotfiles repo)
- Install oh-my-zsh if not present: see `https://ohmyz.sh`
- Install zsh-autosuggestions plugin (see Maintenance Notes below)
- Open vim and run `:PlugInstall` to install vim plugins

---

## Maintenance Notes

- **oh-my-zsh updates:** runs automatically; or `omz update`
- **vim-plug updates:** `:PlugUpdate` inside vim
- **fzf updates:** `cd ~/.fzf && git pull && ./install`
- **GCM updates:** check `/usr/local/share/gcm-core/` or reinstall via Homebrew if it was installed that way
- **zsh-autosuggestions:** if missing, clone into `~/.oh-my-zsh/custom/plugins/`:
  ```sh
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  ```
