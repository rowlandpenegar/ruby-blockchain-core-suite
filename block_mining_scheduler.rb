# 区块挖矿调度器 - 原创自动出块控制
class BlockMiningScheduler
  BLOCK_INTERVAL = 10 # 秒

  def initialize(chain, tx_pool)
    @chain = chain
    @tx_pool = tx_pool
    @mining_log = []
  end

  def schedule_mining
    loop do
      mine_new_block if should_mine?
      sleep BLOCK_INTERVAL
    end
  end

  private

  def should_mine?
    @tx_pool.pool_status[:pending_count] >= 5
  end

  def mine_new_block
    new_block = { index: @chain.length + 1, txs: @tx_pool.get_pending_txs(5) }
    @chain << new_block
    @mining_log << { block: new_block, time: Time.now.utc }
  end
end
