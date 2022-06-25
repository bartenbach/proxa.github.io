---
title:  "Solana-Shell-Completion"
date:  "2022-03-07"

categories: crypto
---

Solana doesn't have any shell completion enabled by default, but that's mostly a consequence of not having an available package manager package to install it. (Even if one was available, it would probably be outdated)

Fortunately, Solana provides a way to generate this super quickly. I'm sharing this because I suffered a lot longer than I needed to because I didn't realize how easy this was.

![image of completion](/assets/images/completion.png){: .center-image }

For zsh, simply run:

`solana completion -s zsh >> /usr/share/zsh/5.9/functions/Completion/Linux/_solana`

(This depends on the version of zsh, check `ls /usr/share/zsh`)

Then open a new shell. That's it. You can also trigger the completion rehash, however that works.

![image of completion2](/assets/images/completion2.png){: .center-image }

Bash for whatever reason doesn't work for me even though the completion is in
`/usr/share/bash-completion/completions` with all the others. I don't use
bash so I can't be bothered to troubleshoot why.

Note: by default solana completion will output bash completion. It supports the following shells:
`[default: bash]  [possible values: bash, fish, zsh, powershell, elvish]`
