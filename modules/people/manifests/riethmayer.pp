class people::riethmayer {
  include emacs
  include tmux
  include iterm2::stable
  include dropbox
  include graphviz
  include propane
  include wget

  $home     = "/Users/${::luser}"
  $my       = "${home}/src"
  $dotfiles = "${my}/dotfiles"

  git::config::global { 'user.name':
    value => 'Jan Riethmayer'
  }

  git::config::global { 'user.email':
    value => 'jan@riethmayer.de'
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
    source  => 'riethmayer/dotfiles',
    require => File[$my]
  }

  file { "${home}/.tmux.conf":
    ensure => 'link',
    target => "${dotfiles}/tmux.conf",
  }

  file { "${home}/bin":
    ensure => 'link',
    target => "${dotfiles}/bin",
  }

  repository { "${home}/.emacs.d":
    source  => 'riethmayer/emacs'
  }

  include projects::bonusbox
  include projects::bitools
}
