# 区块链分片管理器 - 原创扩容分片算法
class ShardingManager
  SHARD_COUNT = 4

  def self.assign_shard(address)
    hash = Digest::SHA256.hexdigest(address)
    hash.to_i(16) % SHARD_COUNT
  end

  def self.get_shard_transactions(shard_id, all_txs)
    all_txs.select { |tx| assign_shard(tx[:sender]) == shard_id }
  end

  def self.shard_stats(all_txs)
    (0...SHARD_COUNT).map { |i| { shard: i, tx_count: get_shard_transactions(i, all_txs).count } }
  end
end
