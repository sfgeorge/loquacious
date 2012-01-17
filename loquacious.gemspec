# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "loquacious"
  s.version = "1.9.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Pease"]
  s.date = "2012-01-16"
  s.description = "Descriptive configuration files for Ruby written in Ruby.\n\nLoquacious provides a very open configuration system written in ruby and\ndescriptions for each configuration attribute. The attributes and descriptions\ncan be iterated over allowing for helpful information about those attributes to\nbe displayed to the user.\n\nIn the simple case we have a file something like\n\n  Loquacious.configuration_for('app') {\n    name 'value', :desc => \"Defines the name\"\n    foo  'bar',   :desc => \"FooBar\"\n    id   42,      :desc => \"Ara T. Howard\"\n  }\n\nWhich can be loaded via the standard Ruby loading mechanisms\n\n  Kernel.load 'config/app.rb'\n\nThe attributes and their descriptions can be printed by using a Help object\n\n  help = Loquacious.help_for('app')\n  help.show :values => true        # show the values for the attributes, too\n\nDescriptions are optional, and configurations can be nested arbitrarily deep.\n\n  Loquacious.configuration_for('nested') {\n    desc \"The outermost level\"\n    a {\n      desc \"One more level in\"\n      b {\n        desc \"Finally, a real value\"\n        c 'value'\n      }\n    }\n  }\n\n  config = Loquacious.configuration_for('nested')\n\n  p config.a.b.c  #=> \"value\"\n\nAnd as you can see, descriptions can either be given inline after the value or\nthey can appear above the attribute and value on their own line."
  s.email = "tim.pease@gmail.com"
  s.extra_rdoc_files = ["History.txt", "README.rdoc", "lib/.loquacious.rb.swp", "lib/loquacious/.configuration.rb.swp"]
  s.files = [".Rakefile.swp", ".gitignore", "History.txt", "README.rdoc", "Rakefile", "examples/gutters.rb", "examples/nested.rb", "examples/simple.rb", "lib/.loquacious.rb.swp", "lib/loquacious.rb", "lib/loquacious/.configuration.rb.swp", "lib/loquacious/configuration.rb", "lib/loquacious/configuration/help.rb", "lib/loquacious/configuration/iterator.rb", "lib/loquacious/core_ext/string.rb", "lib/loquacious/undefined.rb", "spec/configuration_spec.rb", "spec/help_spec.rb", "spec/iterator_spec.rb", "spec/loquacious_spec.rb", "spec/spec_helper.rb", "spec/string_spec.rb", "version.txt"]
  s.homepage = "http://rubygems.org/gems/loquacious"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "loquacious"
  s.rubygems_version = "1.8.10"
  s.summary = "Descriptive configuration files for Ruby written in Ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.6"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.6"])
  end
end
