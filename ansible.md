---
title: ansible
layout: about
---

# Ansible Anti-Patterns

## The Shell and Command Modules
Stop using these, please. Stop it. 

It never fails, every time I try to bring this up, I hear something to the effect of:

_"Aww, come on man. They're not that bad. I mean it works heheheh! Gets the job done!"_

![The guy who uses the shell module](assets/images/clown.jpg){: .center-image style="width: 300px;"  } *A regular user of the shell and command module*

### They break `--check` mode
Since it doesn't work in check mode, you can no longer test your playbooks/roles using `--check`.

### They always report as `changed`
Regardless of what actually happened, the shell and command modules report changes, so the output of a shell or command task is meaningless and tells you almost nothing.

If you stack enough of these up, you really can tell nothing from the output at all, regardless of what you're doing.

The workaround here is to write custom handlers for `changed_when` and `failed_when` which is tedious and unnecessary if you just use a module instead.

### Defeats the purpose of using Ansible
What if I wrote a Java program to open a Python shell and execute Python code for me? Would that not be strange and unnecessary not to mention inefficient?

That is exactly what you are doing when you do this. You are writing a shell script, but instead of writing it normally you are embedding it in YAML.

You're also missing out on all the edge cases that the module has already thought of and been crafted to catch/handle. Updating ansible lets you get updates to these modules, but does nothing for your shell commands.

### May be idempotent...may not be!
It's like a fun little game - can you run it twice and get the same results or not? It's anybody's guess!

Some shell commands are, some aren't.

### Dependent on the user's shell configuration
I've never seen this actually cause a problem, but I'm adding it for completeness anyway.
