# Puppet module: bundler

This is a Puppet module for bundler
It provides only package installation and management

Based on Example42 layouts by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-bundler

Module development sponsored by [AllOver.IO](http://www.allover.io)

Released under the terms of Apache 2 License.

This module requires the presence of Example42 Puppi module in your modulepath.


## USAGE - Basic management

* Install bundler with default settings

        class { 'bundler': }

* Install a specific version of bundler package

        class { 'bundler':
          version => '1.0.1',
        }

* Remove bundler resources

        class { 'bundler':
          absent => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'bundler':
          noops => true
        }

* Automatically include a custom subclass

        class { 'bundler':
          my_class => 'example42::my_bundler',
        }


## TESTING
[![Build Status](https://travis-ci.org/example42/puppet-bundler.png?branch=master)](https://travis-ci.org/example42/puppet-bundler)
