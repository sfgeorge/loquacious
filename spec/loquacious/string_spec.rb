require 'spec_helper'

describe String do

  it "removes a leading gutter from all lines" do
    str = "  | foo"
    result = str.gutter!
    result.should be == " foo"
    result.should equal(str)

    str = <<-STRING
    | And this is where gutters really shine!
    | HERE DOCS!!
    ||they are the best
    |
    |    You can indent stuff nicely and all that
    |all done now
    STRING

    str.gutter!
    str.should be == " And this is where gutters really shine!\n HERE DOCS!!\n|they are the best\n\n    You can indent stuff nicely and all that\nall done now\n"
  end

  it "creates a copy when removing a leading gutter" do
    str = "  | foo"
    result = str.gutter
    result.should be == " foo"
    result.should_not equal(str)
  end
end
