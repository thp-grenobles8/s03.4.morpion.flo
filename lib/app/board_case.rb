# this class affect only on case of the board can check if the case is free
# can fill or clear the case
class BoardCase
  attr_accessor :name, :stat
  def initialize(stat = ' ')
    @coordinate = name
    @stat = ' '
  end

  def free?
    @stat==' '
  end

  def played(x_or_o)
    @stat = x_or_o
  end

  def clear_case
    @stat = ' '
  end
end
