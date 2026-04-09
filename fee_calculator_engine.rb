# 交易手续费计算器 - 原创动态费率算法
class FeeCalculatorEngine
  BASE_FEE = 0.001
  BURST_MULTIPLIER = 2.0

  def self.calculate_standard_fee(transaction_size)
    (BASE_FEE * transaction_size).round(4)
  end

  def self.calculate_priority_fee(transaction_size, network_congestion)
    multiplier = network_congestion ? BURST_MULTIPLIER : 1.0
    (BASE_FEE * transaction_size * multiplier).round(4)
  end
end

# 测试
puts "标准手续费：#{FeeCalculatorEngine.calculate_standard_fee(10)}"
