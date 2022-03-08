---
title:  "Solana-Shell-Completion"
date:  "2022-03-07"

categories: crypto
---

Solana doesn't have any shell completion enabled by default, but that's mostly a consequence of not having an available package manager package to install it. (Even if one was available, it would probably be outdated)

Fortunately, Solana provides a way to generate this super quickly. I'm sharing this because I suffered a lot longer than I needed to because I didn't realize how easy this was.

For zsh, simply run:

`solana completion -s zsh >> /usr/share/zsh/5.8.1/functions/Completion/Linux/_solana`

Then open a new shell. That's it. You can also trigger the completion rehash, however that works, but I can't remember how to do it and opening a new shell is easy enough :)

Note: by default solana completion will output bash completion. It supports the following shells:
`[default: bash]  [possible values: bash, fish, zsh, powershell, elvish]`
