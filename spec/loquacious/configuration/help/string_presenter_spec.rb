require 'spec_helper'

describe Loquacious::Configuration::Help::StringPresenter do

  it "can be created from a string and return a string" do
    presenter = described_class.new "foobar"
    presenter.to_s.should be == "foobar"
  end

  it "reduces to a size by replacing characters from the middle" do
    described_class.new("this is a longish string").reduce(10).should be == "this...ing"
    described_class.new("this is a longish string").reduce(15).should be == "this i...string"
    described_class.new("this is a longish string").reduce(24).should be == "this is a longish string"

    described_class.new("this is a longish string").reduce(10, '--').should be == "this--ring"
  end

  it "indents by a given number of spaces" do
    described_class.new("hello").indent(2).should be == "  hello"
    described_class.new("hello\nworld").indent(4).should be == "    hello\n    world"
    described_class.new("  a\nslightly\n longer\n   string\n").indent(2).should be == "    a\n  slightly\n   longer\n     string\n  "
  end

  it "indents using a leader string" do
    described_class.new("hello").indent("foo ").should be == "foo hello"
    described_class.new("hello\nworld").indent("...").should be == "...hello\n...world"
    described_class.new("  a\nslightly\n longer\n   string\n").indent("#").should be == "#  a\n#slightly\n# longer\n#   string\n#"
  end
end
