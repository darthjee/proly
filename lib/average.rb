class Average
  def average
    sum * 1.0 / length
  end

  def times(count)
    count.times do
      self + yield
    end
    self
  end

  def +(value)
    self.sum += value
    self.length += 1
    self
  end

  def length
    @length ||= 0
  end

  def sum
    @sum ||= 0
  end

  private

  attr_writer :sum, :length
end
