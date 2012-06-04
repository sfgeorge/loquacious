# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "loquacious/version"

Gem::Specification.new do |s|
  s.name        = "adhearsion-loquacious"
  s.version     = Loquacious::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tim Pease"]
  s.email       = "tim.pease@gmail.com"
  s.homepage    = "http://rubygems.org/gems/loquacious"
  s.summary     = "Descriptive configuration files for Ruby written in Ruby."
  s.description = %Q{Descriptive configuration files for Ruby written in Ruby.
    Loquacious provides a very open configuration system written in ruby and descriptions for each configuration attribute.
    The attributes and descriptions can be iterated over allowing for helpful information about those attributes to be displayed to the user.
    In the simple case we have a file something like:
      Loquacious.configuration_for('app') {
        name 'value', :desc => "Defines the name"
        foo  'bar',   :desc => "FooBar"
        id   42,      :desc => "Ara T. Howard"
      }
      Which can be loaded via the standard Ruby loading mechanisms
        load 'config/app.rb'
      The attributes and their descriptions can be printed by using a Help object
        help = Loquacious.help_for('app')
        help.show :values => true        # show the values for the attributes, too
      Descriptions are optional, and configurations can be nested arbitrarily deep.
        Loquacious.configuration_for('nested') {
          desc "The outermost level"
          a {
            desc "One more level in"
            b {
              desc "Finally, a real value"
              c 'value'
            }
          }
        }
        config = Loquacious.configuration_for 'nested'
        p config.a.b.c  #=> "value"
        And as you can see, descriptions can either be given inline after the value or they can appear above the attribute and value on their own line.
      }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler', ["~> 1.0"]
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rspec', ["~> 2.7.0"]
  s.add_development_dependency 'ruby_gntp'
  s.add_development_dependency 'yard'
end
