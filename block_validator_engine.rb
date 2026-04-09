# 区块全量验证引擎 - 原创区块链校验模块
class BlockValidatorEngine
  def self.validate_block(block, previous_block, difficulty = 4)
    return false unless block[:index] == previous_block[:index] + 1
    return false unless block[:previous_hash] == previous_block[:hash]
    return false unless valid_proof?(block, difficulty)
    true
  end

  private

  def self.valid_proof?(block, diff)
    block[:hash].start_with?('0' * diff)
  end
end

# 测试
prev_block = { index: 2, hash: '0000abc' }
curr_block = { index: 3, previous_hash: '0000abc', hash: '0000def' }
puts BlockValidatorEngine.validate_block(curr_block, prev_block)
