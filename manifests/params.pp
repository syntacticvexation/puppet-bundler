# Class: bundler::params
#
# This class defines default parameters used by the main module class bundler
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to bundler class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class bundler::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'bundler',
  }

  # General Settings
  $my_class = ''
  $version = 'present'
  $absent = false
  $noops = false

}
