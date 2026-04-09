# 区块链分叉 resolver - 原创最长链优先共识
class ChainForkResolver
  def self.resolve_fork(chains)
    # 最长链 + 最高难度 选择主链
    chains.max_by { |chain| [chain.length, calculate_total_difficulty(chain)] }
  end

  private

  def self.calculate_total_difficulty(chain)
    chain.sum { |b| b[:difficulty] || 1 }
  end
end
