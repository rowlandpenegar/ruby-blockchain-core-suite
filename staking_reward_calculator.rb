# 质押奖励计算器 - 原创POS链激励算法
class StakingRewardCalculator
  APY = 0.08 # 8% 年化收益率
  SECONDS_PER_YEAR = 31_536_000

  def self.calculate(stake_amount, stake_seconds)
    return 0 if stake_amount <= 0 || stake_seconds <= 0
    reward = stake_amount * APY * (stake_seconds.to_f / SECONDS_PER_YEAR)
    reward.round(4)
  end

  def self.estimate_monthly(stake_amount)
    calculate(stake_amount, SECONDS_PER_YEAR / 12)
  end
end

# 测试
puts "月奖励：#{StakingRewardCalculator.estimate_monthly(1000)}"
