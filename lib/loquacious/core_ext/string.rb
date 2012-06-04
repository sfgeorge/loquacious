class String

  # call-seq:
  #    "  | foo\n  | bar".gutter!    #=> " foo\n bar"
  #
  # Removes a leading _gutter_ from all lines in the string. The gutter is
  # defined leading whitespace followed by a single pipe character. This
  # method is very useful with heredocs.
  #
  # The string will be altered by this method.
  #
  def gutter!
    gsub! %r/^[\t\f\r ]*\|?/, ''
    self
  end

  # call-seq:
  #    "  | foo\n  | bar".gutter!    #=> " foo\n bar"
  #
  # Removes a leading _gutter_ from all lines in the string. The gutter is
  # defined leading whitespace followed by a single pipe character. This
  # method is very useful with heredocs.
  #
  def gutter
    self.dup.gutter!
  end
end
