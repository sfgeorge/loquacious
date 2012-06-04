class StringIO
  alias :_readline :readline
  def readline
    @pos ||= 0
    seek @pos
    line = _readline
    @pos = tell
    return line
  rescue EOFError
    nil
  end

  def clear
    @pos = 0
    seek 0
    truncate 0
  end

  def to_s
    @pos = tell
    seek 0
    str = read
    seek @pos
    return str
  end
end
