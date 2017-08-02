# Puppet tmpreaper (tmpwatch) module

This module installs tmpreaper or tmpwatch.

### Requirements

Module has been tested on:

* Puppet 3.3, 3.7.x, 3.8.x
* Debian and Red Hat family systems

Required modules:

* stdlib (https://github.com/puppetlabs/puppetlabs-stdlib)

# Quick Start

Setup client

```puppet
include tmpreaper
```

Full configuration options:

```puppet
class { 'tmpreaper':
  enabled       => false|true,     # enable service
  tmptime       => 7               # only delete files that haven't been accessed longer than $tmptime
  protect_extra => [],             # list of file patterns to protect (e.g. /tmp/tmux-*)
  packages      => [...],          # list of packages to install
}
```

***

CERIT Scientific Cloud, <support@cerit-sc.cz>
TenTwentyFour S.à r.l., <puppet@tentwentyfour.lu>
