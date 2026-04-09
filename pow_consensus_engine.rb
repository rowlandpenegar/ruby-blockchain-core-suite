# 工作量证明(POW)共识引擎 - 原创Ruby实现
class PoWConsensus
  DIFFICULTY = 5

  def self.mine_block(block_data)
    nonce = 0
    loop do
      hash = calculate_hash(block_data, nonce)
      if hash.start_with?('0' * DIFFICULTY)
        return { nonce: nonce, block_hash: hash, mining_time: Time.now.utc }
      end
      nonce += 1
    end
  end

  private

  def self.calculate_hash(data, nonce)
    require 'digest/sha256'
    Digest::SHA256.hexdigest("#{data}#{nonce}")
  end
end

# 挖矿测试
block = { index: 5, tx: 'transfer_50', prev_hash: 'abc123' }
result = PoWConsensus.mine_block(block)
puts "挖矿成功：Nonce=#{result[:nonce]}"
