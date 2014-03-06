class projects::bitools {
  package { 'jq':
    ensure => present
  }

  include go
  go::version { '1.1.1': }
  # this enables you to use json2csv
  # go get github.com/jehiah/json2csv

  include python

  package { 'csvkit':
    provider => pip,
    ensure => installed
  }

  package { 'pygments':
    provider => pip,
    ensure => installed
  }

  package { 'untangle':
    provider => pip,
    ensure => installed
  }

  package { 'pandas':
    provider => pip,
    ensure => installed
  }

  package { 'scikits.learn':
    provider => pip,
    ensure => installed
  }

  package { 'ipython':
    provider => pip,
    ensure => installed
  }

  package { 'cssselect':
    provider => pip,
    ensure => installed
  }

  package { 'lxml':
    provider => pip,
    ensure => installed
  }

  $home     = "/Users/${::luser}"
  # requires export PATH=$PATH:$HOME/.bi_tools/tools in your config
  repository { "${home}/.bi_tools":
    source => 'jeroenjanssens/data-science-toolbox'
  }

}
