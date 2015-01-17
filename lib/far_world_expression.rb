# データ構造をどう持つか
class FarWorldExpression
  def initialize(expression)
    left, operator, right = expression.scan(/([0-9]+)([\|\&\+\*])?(.*)?$/)
  end

  def evaluate
    eval(@expression)
  end
end
