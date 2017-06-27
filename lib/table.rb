class Table
  X_RANGE = 1..5
  Y_RANGE = 1..5

  def within_table_bounds(x, y)
    X_RANGE.cover?(x.to_i) && Y_RANGE.cover?(y.to_i)
  end
end
