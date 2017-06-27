class Table
  X_RANGE = 1..5
  Y_RANGE = 1..5

  def within_x_range(x)
    X_RANGE.cover?(x.to_i)
  end

  def within_y_range(y)
    Y_RANGE.cover?(y.to_i)
  end

end
