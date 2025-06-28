# 🖋️ Vim Clipboard Fix for Wayland

This repo provides a simple workaround to fix Vim clipboard issues on **Wayland**.

If you're using Vim and find that `"+y` or `"+p` doesn't work (i.e., copying/pasting with the system clipboard does nothing), this solution bridges the gap using [`wl-copy`](https://github.com/bugaevc/wl-clipboard) and [`wl-paste`](https://github.com/bugaevc/wl-clipboard).

✅ No need for Vim with `+clipboard` support  
✅ No need to switch to X11  
✅ Works on any Wayland-based setup (GNOME, KDE, Sway, Hyprland, etc.)

---

## 🔧 What It Does

This setup maps new clipboard commands in Vim that use `wl-copy` and `wl-paste` behind the scenes to make clipboard operations work smoothly:

- Copy selected text from Vim to your system clipboard
- Paste clipboard content into Vim
- (Optional) Automatically copy all yanks to clipboard

---

## 📦 Requirements

- A Wayland session
- `wl-clipboard` installed (`wl-copy`, `wl-paste`)
- Vim (even without `+clipboard`)

### 🛠 Install `wl-clipboard`

```bash
# Debian/Ubuntu
sudo apt install wl-clipboard
```
```
# Arch
sudo pacman -S wl-clipboard
```

### 🧾 Vim Clipboard Workaround Snippet

Add the following lines to your `~/.vimrc` (or source the `wayland-clipboard.vim` file in this repo):

```vim
" Yank selected text to system clipboard using wl-copy
vnoremap <leader>y :'<,'>w !wl-copy<CR><CR>

" Paste from system clipboard using wl-paste
nnoremap <leader>p :r !wl-paste<CR>

" Optional: Automatically copy any yank to system clipboard
augroup AutoCopyWL
  autocmd!
  autocmd TextYankPost * silent! call system('wl-copy', getreg('"'))
augroup END
```
## 📚 How to Use

### 📋 Copy from Vim to your system clipboard

1. Open a file in Vim.
2. Press `v` to enter **visual mode** (or `V` for visual line mode).
3. Move your cursor to select the text you want to copy.
4. Press `\y` (that’s `<leader>y`) to copy the selection.
5. You can now paste it into any other app using `Ctrl+V`.

### 📥 Paste into Vim from your system clipboard

1. In **normal mode**, move your cursor where you want the clipboard content inserted.
2. Press `\p` (that’s `<leader>p`).
3. The content from your clipboard will be pasted right there.

---
