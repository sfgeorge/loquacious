
begin
  require 'bones'
rescue LoadError
  abort '### please install the "bones" gem ###'
end

task :default => 'spec:run'
task 'gem:release' => 'spec:run'

Bones {
  name         'adhearsion-loquacious'
  authors      'Tim Pease', 'Adhearsion Team'
  email        'tim.pease@gmail.com', 'all@adhearsion.com'
  url          'http://rubygems.org/gems/adhearsion-loquacious'
  readme_file  'README.rdoc'
  spec.opts << '--color'
  use_gmail

  depend_on 'rspec', '~> 2.6', :development => true
}

task 'ann:prereqs' do
  Bones.config.name = 'Adhearsion-Loquacious'
end

# depending on bones (even as a development dependency) creates a circular
# reference that prevents the auto install of loquacious when instsalling
# bones
::Bones.config.gem._spec.dependencies.delete_if {|d| d.name == 'bones'}
