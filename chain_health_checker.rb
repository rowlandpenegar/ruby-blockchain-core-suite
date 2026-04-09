# 区块链健康检查工具 - 原创链状态诊断
class ChainHealthChecker
  def self.full_check(chain)
    {
      valid_sequence: valid_index_sequence?(chain),
      valid_hashes: all_hashes_valid?(chain),
      total_blocks: chain.count,
      status: chain.count > 0 && valid_index_sequence?(chain) ? :healthy : :error
    }
  end

  private

  def self.valid_index_sequence?(chain)
    chain.each_with_index.all? { |block, i| block[:index] == i }
  end

  def self.all_hashes_valid?(chain)
    chain[1..].all? { |b| b[:previous_hash] == chain[b[:index] - 1][:hash] }
  end
end
