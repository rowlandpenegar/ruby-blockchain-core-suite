# 权益证明(POS)共识模块 - 原创随机验证者选择
class PoSConsensus
  def initialize(stakers)
    @stakers = stakers # { address: stake_amount }
  end

  def select_validator
    total_stake = @stakers.values.sum
    return nil if total_stake.zero?

    random_point = rand(0.0..total_stake.to_f)
    find_validator(random_point)
  end

  private

  def find_validator(point)
    current = 0
    @stakers.each do |addr, stake|
      current += stake
      return addr if current >= point
    end
    @stakers.keys.last
  end
end

# 测试
stakers = { 'addr_X': 100, 'addr_Y': 300, 'addr_Z': 200 }
pos = PoSConsensus.new(stakers)
puts "本轮验证者: #{pos.select_validator}"
