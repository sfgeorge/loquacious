# encoding: utf-8

%w{
  bundler/setup
  loquacious
}.each { |f| require f }

Bundler.require(:default, :test) if defined?(Bundler)

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.color_enabled = true

  config.before :each do
    Loquacious::Undefined.io.clear

    table = Loquacious::Configuration.instance_variable_get(:@table)
    table.clear

    Loquacious.configuration_for('specs') do
      first   'foo', :desc => 'foo method'
      second  'bar', :desc => 'bar method'

      desc 'the third group'
      third {
        answer 42, :desc => 'life the universe and everything'
        question :symbol, :desc => 'perhaps you do not understand'
      }
    end
  end

  Loquacious::Undefined.io = StringIO.new
end
