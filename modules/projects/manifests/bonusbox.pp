class projects::bonusbox {
  include couchdbx
  include postgresql
  include imagemagick
  include erlang
  include heroku
  include redis
  include java
  include chrome
  include firefox
  include rabbitmq
  include python

  package { 'qt':
    ensure => present
  }

  package { 'chromedriver':
    ensure => present
  }

  package { 'selenium-server-standalone':
    ensure => present
  }

  package { 'awscli':
    provider => pip,
    ensure => installed
  }

}
