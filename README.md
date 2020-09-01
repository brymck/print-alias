print-alias
===========

![Test](https://github.com/brymck/print-alias/workflows/Test/badge.svg)
[![codecov](https://codecov.io/gh/brymck/print-alias/branch/master/graph/badge.svg)](https://codecov.io/gh/brymck/print-alias)

[![Build status](https://badge.buildkite.com/4186527ec2fb1a9ca038fbb8296b1869c9a62d5096a0291e5d.svg)](https://buildkite.com/brymck-dot-io/print-alias)

This prints commands with aliases expanded whenever you use an alias at the command line.

<img width="385" alt="demo" src="images/demo.png">

Usage
-----

With [zplug](https://github.com/zplug/zplug), add the following to your `~/.zshrc`:

```zsh
zplug "brymck/print-alias"
```

You can also use [Antigen](https://github.com/zsh-users/antigen):

```zsh
antigen bundle brymck/print-alias
```

And lastly, if you want to `source` it manually, you can also clone this repo and use:

```zsh
source path/to/print-alias.plugin.zsh
```

Configuration
-------------

Change expanded alias text color (to bright white, in this example):

```zsh
export PRINT_ALIAS_FORMAT=$'\e[1m'

zplug "brymck/print-alias"
```
