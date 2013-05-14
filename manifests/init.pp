# = Class: bundler
#
# This is the main bundler class
#
#
# == Parameters
#
# [*dependencies_class*]
#   The name of the class that installs dependencies and prerequisite
#   resources needed by this module.
#   Default is $bundler::dependencies which uses Example42 modules.
#   Set to '' to not install any dependency (you must provide what's
#   defined in graylog2/manifests/dependencies.pp in some way).
#   Set directy the name of a custom class to manage there the dependencies
#
# [*provider*]
#   The Puppet provider to use to install bundle package
#   Default: gem
#   Set to undef to leave Puppet decide
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, bundler class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $bundler_myclass
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $bundler_absent
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in bundler::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of bundler package
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include bundler"
# - Call bundler as a parametrized class
#
# See README for details.
#
#
class bundler (
  $dependencies_class  = params_lookup( 'dependencies_class' ),
  $provider            = params_lookup( 'provider' ),
  $my_class            = params_lookup( 'my_class' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' )
  ) inherits bundler::params {

  $bool_absent=any2bool($absent)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $bundler::bool_absent ? {
    true  => 'absent',
    false => $bundler::version,
  }

  ### Managed resources
  if $bundler::dependencies_class != '' {
    require $bundler::dependencies_class
  }

  if ! defined(Package[$bundler::package]) {
    package { $bundler::package:
      ensure   => $bundler::manage_package,
      provider => $bundler::provider,
      noop     => $bundler::bool_noops,
    }
  }

  ### Include custom class if $my_class is set
  if $bundler::my_class {
    include $bundler::my_class
  }

}
