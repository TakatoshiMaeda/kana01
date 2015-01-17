# データ構造をどう持つか
# 4*5+6&7|8
class FarWorldExpression
  def initialize(expression)
    #left, operator, right = expression.scan(/([0-9]+)([\|\&\+\*])?(.*)?$/)
    @expression = [
      [
        4, '*', [
          5, '+', [
            6, '&', [
              7, '|', 8
            ]
          ],
        ],
      ],
    ]

    result = []

    # or
    posisions = select_positions('|')
    posisions.each do |idx|
      exp = @expression[idx]
      result[idx] << "(#{exp.join})"
      unless result[idx - 1].nil?

      end
    end
  end

  def parse(expression)
    left, operator, right = expression.scan(/([0-9]+)([\|\&\+\*])?(.*)?$/)[0]
    if operator == nil
      left
    else
    [
      left,
      operator,
      parse(right)
    ]
    end
  end

  def select_posisions(operator)
    positions = []
    @expression.each_with_index do |exp, idx|
      if exp[2] == operator
        posisions << idx
      end
    end
    positions
  end

  def and_posisions

  end

  def first_posision

    @expression.each_with_index do |exp, idx|
      if exp[2] == '&'
        position = idx
      end
    end
    return position unless position.nil?

    @expression.each_with_index do |exp, idx|
      if exp[2] == '+'
        position = idx
      end
    end
    return position unless position.nil?

    @expression.each_with_index do |exp, idx|
      if exp[2] == '*'
        position = idx
      end
    end
    return position unless position.nil?
  end

  def evaluate
    eval(@expression)
  end
end
