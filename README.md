iTerm2
------
- load the colorscheme from `Snazzy.itermcolors`

- make ⌥+←/→ work:

  Edit iTerms key mappings and set them to:

  `0x1b 0x62 / 0x1b 0x66`

nvm
---
- For better startup performance, NVM is not fully initialized. Before using NVM, run:

  `nvm init`

git
---

Set global user details:
```
git config --global user.name "Foo Bar"
git config --global user.email "foo@example.com"
```

Enable global `.gitignore` file:
```
git config --global core.excludesFile "${HOME}/.dotfiles/.gitignore"
```

Add per-project configuration in `~/.gitconfig`:
```
[includeIf "gitdir:~/Work/"]
	path = ~/Work/.gitconfig
```
Then project-specifig configuration may be put in these
`.gitconfig` files and apply only to that folder.
