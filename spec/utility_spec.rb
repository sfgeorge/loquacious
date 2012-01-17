require File.expand_path('spec_helper', File.dirname(__FILE__))

describe Loquacious::Utility do
  let(:obj) {
    Loquacious.configuration_for('app') {
      name :testing, :desc => "Defines the name", :transform =>  Proc.new{|arg| arg.to_sym }
      foo  'bar',   :desc => "FooBar"
      id   42,      :desc => "Ara T. Howard"
      bar {
        recur 'sive'
        baz {
          inner 'config'
        }
      }
    }
  }

  describe "#env_var_name" do
    it "returns the correct name for a config value and its object" do
      ::Loquacious::Utility.env_var_name("inner", obj.bar.baz).should == "LOQ_APP_BAR_BAZ_INNER"
    end
  end
end
