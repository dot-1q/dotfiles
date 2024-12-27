# `[tiago] ~/`

### How it looks:
![image](ws.png)

### What's being used:
- IDE/Dev environment: [neovim](https://neovim.io)
- Neovim Initial Setup: [Kickstart](https://github.com/nvim-lua/kickstart.nvim), but it is now [modularized](https://github.com/dam9000/kickstart-modular.nvim)
- Terminal: [Ghostty](https://github.com/ghostty-org/ghostty)
- Terminal Multiplexer: [Tmux](https://github.com/tmux/tmux)
- Terminal Colorscheme (ported): [Gruvbox Material](./.config/ghostty/config)
- Neovim Colorscheme: [Gruvbox Material](https://github.com/f4z3r/gruvbox-material.nvim)
- Zsh Theme: [powerlevel10k](https://github.com/romkatv/powerlevel10k)

### Notes:

#### My config is heavily influenced by [rwxrob](https://www.youtube.com/@rwxrob)!

Because of it, I'm starting to have a more terminal-centric workflow. I can do quick internet searches from the terminal, to quickly look-up information and copy-paste if needed. I've also implemented an [AI query](https://groq.com) into
my terminal via the alias `??`, which allows me to communicate with it very fast and get the answers I want even faster. AI is here and its akin to the coming of the calculator IMO lol. Don't use it as a substitute to knowing the basics/fundamentals of anything, but DO USE IT as a personal assistant, 
a Google search results formatter and aggregator. It is the future and it has increased my productivity immensely.

I've ditched [yabai](https://github.com/koekeishiya/yabai) as the tiling window manager because I found myself not really tiling anything outside of the terminal application, hence, I decided to just 
use a terminal multiplexer (tmux). For the rest of the applications I just use Apple's Stage Manager, and I don't really need anything more, besides, Apple will bring better tiling options in the next OS update.

From all the colorschemes I've tried, the one that is truly easy on the eyes and highlights stuff without it being too noisy, is Gruvbox material. So much so, that I've implemented its color palette everywhere I could.

I've also tried some tmux themes to customize the status bar, but they are all too noisy or old looking, relying too much on powerline symbols. I just stuck with the default one and changed it minimally to use Gruvbox's Material 
color palette. I also put a `battery` and `network` script so that it shows that information in the status bar.
Because of that, I only have 2 tmux plugins. One for saving and resurrecting sessions, and the other one simply adds some icons to the window's names.

Changed iTerm2 to Alacritty just because. It's just slightly faster when displaying text. Not much else to it. Configuration is more config file based, which I also prefer.

Added p10k as the Zsh shell theme and configured it via `p10k configure`. Its very easy to configure, fast and not very noisy.

The `/scripts` folder contains some personal scripts that are in my `PATH`, which are influenced by rwxrob, which allow me to browse the web and query the AI and so on from the terminal.
