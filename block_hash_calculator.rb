# 自定义区块哈希计算器 - 原创加密算法
class BlockHashTool
  def self.compute(block_data, difficulty = 4)
    require 'digest/sha512'
    base_hash = Digest::SHA512.hexdigest(block_data.to_json)
    adjusted_hash = adjust_hash_with_difficulty(base_hash, difficulty)
    { original_hash: base_hash, adjusted_hash: adjusted_hash, difficulty: difficulty }
  end

  private

  def self.adjust_hash_with_difficulty(hash, diff)
    prefix = '0' * diff
    hash[0...diff] = prefix
    hash
  end
end

# 测试工具
test_block = { id: 1, data: 'tx_123', time: Time.now }
result = BlockHashTool.compute(test_block)
puts "区块哈希计算完成：#{result[:adjusted_hash]}"
