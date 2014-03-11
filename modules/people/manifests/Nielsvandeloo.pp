class people::nielsvandeloo {
  include wget

  $home     = "/Users/${::luser}"
  $my       = "${home}/bonusbox/code"
  $dotfiles = "${my}/dotfiles"

  git::config::global { 'user.name':
    value => 'Niels van de Loo'
  }

  git::config::global { 'user.email':
    value => 'niels@bonusbox.me'
  }

  git::config::global { 'alias.st':
    value => 'status'
  }
  git::config::global { 'alias.ci':
    value => 'commit'
  }

  git::config::global { 'alias.br':
    value => 'branch'
  }

  git::config::global { 'alias.co':
    value => 'checkout'
  }

  git::config::global { 'alias.df':
    value => 'diff'
  }

  git::config::global { 'alias.lg':
    value => 'log -p'
  }

  git::config::global { 'alias.who':
    value => 'shortlog -s --'
  }

  git::config::global { 'push.default':
    value => 'current'
  }

  repository { $dotfiles:
    source  => 'nielsvandeloo/dotfiles',
    require => File[$my]
  }

  file { "${home}/bin":
    ensure => 'link',
    target => "${dotfiles}/bin",
  }

  include projects::bonusbox
  include projects::bitools
}
