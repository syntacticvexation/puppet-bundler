# Class: bundler::dependencies
#
# This class installs bundler prerequisites
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by bundler if the parameter
# install_prerequisites is set to true
# Note: This class may contain resources available on the
# Example42 modules set
#
class bundler::dependencies {
  if ! defined(Package['rubygems']) {
    package { 'rubygems':
      ensure   => present,
    }
  }
}
