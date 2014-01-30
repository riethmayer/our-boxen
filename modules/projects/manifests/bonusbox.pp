class projects::bonusbox {
  include couchdbx
  include postgresql
  include imagemagick
  include erlang
  include heroku
  include redis
  include chromedriver
  include java
  include chrome
  include firefox

  package { 'qt':
    ensure => present
  }

  package { 'selenium-server-standalone':
    ensure => present
  }

}
