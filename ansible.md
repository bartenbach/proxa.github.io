---
title: Ansible Anti-Patterns
layout: article
---

## The Shell and Command Modules
![Pointless shell module usage](/assets/images/file-module.jpg){: .center-image style="width: 400px;"}

![The guy who uses the shell module](assets/images/clown.jpg){: .center-image style="width: 300px;"  }*"Come on, man. They're not that bad. They work don't they? Gets the job done, doesn't it?"*
*- the guy writing entire roles using the shell and command modules*{: style="display: block;text-align: center" }

### They break `--check` mode
Since these modules don't work in check mode, you can no longer test your playbooks using `--check`.

### They always report as `changed`
Regardless of what actually happened, the shell and command modules report changes, so the output of a shell or command task is meaningless and tells you almost nothing (aside from the fact that it didn't error out).

If you stack enough of these up, you can tell just about nothing from the output at all. Every thing just says "changed" and it's all lies.

The workaround here is to write custom handlers for `changed_when` and `failed_when` which is tedious, error-prone, and unnecessary because in 95% of cases you can simply use an Ansible module instead.

### They defeat the entire purpose of using Ansible
What if I wrote a Java program to open a Python shell and execute Python code? Would that not be strange and unnecessary - not to mention inefficient?

This is exactly what you are doing when you use the shell and command modules. You are writing a shell script, but instead of writing it in the usual way you are embedding it in YAML.

You're also missing out on all the edge cases that the dedicated Ansible modules have already thought of and have been crafted to catch/handle. Updating ansible lets you get updates to these modules, but does nothing for your shell commands.

### They may be idempotent...they may not be!
It's like a fun little game - can you run it twice and get the same results or not? It's anybody's guess!

Some shell commands are, some aren't.

### They are dependent on the user's shell configuration
I've never seen this actually cause a problem, but I'm adding it for completeness anyway. You might get zsh, bash, csh, dash, tcsh, ksh...(you get the point).

### They generate `ansible-lint` findings
Maybe I'm reaching here, but if you're writing a lot of ANYTHING, you should be using a linter.

Yes, you could configure `ansible-lint` to ignore this, but it's generating a finding for good reason. Interestingly, it doesn't complain about the windows ones.

![ansible-lint](/assets/images/ansible-lint.jpg){: .center-image style="width:500px;"}

#### Do you just really hate shell scripting?
Absolutely not! Shell scripts are incredibly useful for a variety of different tasks, and I encourage everyone to learn to write them. However, in this particular case it should really be avoided at all costs. If you want to write a shell script, just write a shell script - don't embed it in YAML.

#### Isn't this unavoidable sometimes?
It is. I have run into situations where I have had to use the modules I'm begging you not to use in this article. *However,* when I do use them, I add a comment explaining *why* I had to use them and what I wanted to accomplish. 

In 90% of the Ansible peer reviews I have done with shell and command modules being used, people are not using the shell and command modules because they have no other choice. They are usually using them because they don't know any better - and that's why I am writing this article.
