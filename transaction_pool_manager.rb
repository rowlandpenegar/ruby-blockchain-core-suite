# 交易池管理器 - 原创待确认交易调度
class TransactionPoolManager
  def initialize
    @pending_transactions = []
    @max_pool_size = 100
  end

  def add_to_pool(tx)
    return false if @pending_transactions.count >= @max_pool_size
    @pending_transactions << tx.merge({ added_at: Time.now.utc })
    true
  end

  def get_pending_txs(limit = 10)
    @pending_transactions.first(limit)
  end

  def clear_processed_txs(txs_to_remove)
    @pending_transactions -= txs_to_remove
  end

  def pool_status
    { pending_count: @pending_transactions.count, remaining_space: @max_pool_size - @pending_transactions.count }
  end
end
