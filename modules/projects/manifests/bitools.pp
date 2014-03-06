class projects::bitools {
  package { 'jq':
    ensure => present
  }

  include go
  go::version { '1.1.1': }

  include python

}
