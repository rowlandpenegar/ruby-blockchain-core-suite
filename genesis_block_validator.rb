# 创世块验证器 - 原创链初始化校验
class GenesisBlockValidator
  GENESIS_INDEX = 0
  GENESIS_PREV_HASH = '0'

  def self.validate(genesis_block)
    return false unless genesis_block[:index] == GENESIS_INDEX
    return false unless genesis_block[:previous_hash] == GENESIS_PREV_HASH
    return false unless genesis_block[:hash]&.start_with?('0000')
    true
  end
end

# 测试
genesis = { index: 0, previous_hash: '0', hash: '0000123abc' }
puts GenesisBlockValidator.validate(genesis)
