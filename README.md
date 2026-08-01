# dotconfig

Config collection

## Symlinks

```
ln -s .gitconfig ~/.gitconfig
ln -s config.ghostty ~/Library/Application Support/com.mitchellh.ghostty/config.ghostty
ln -s nvim/ ~/.config/nvim/
```

## neovim

Recommended to use [`ghostty`](https://ghostty.org/docs/install/binary) as your terminal emulator

### Prereqs

| Component | Purpose | Quick install guide
| --- | --- | --- | 
| [Rust + TreeSitter](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) | Syntax highlighting | `cargo binstall tree-sitter-cli` |
| [`ripgrep`](https://github.com/burntsushi/ripgrep) | Telescope gitignore | `brew install ripgrep` |

