class FarWorldExpression
  def initialize(expression)
    @expression = expression
  end

  def evaluate
    eval(expression)
  end
end
