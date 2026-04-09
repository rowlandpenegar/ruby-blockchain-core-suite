# 去中心化账本核心 - 原创分布式存储逻辑
class DecentralizedLedger
  def initialize
    @ledger = []
    @node_ids = []
  end

  def add_transaction(sender, receiver, amount)
    tx = {
      id: "tx_#{SecureRandom.hex(8)}",
      sender: sender,
      receiver: receiver,
      amount: amount,
      timestamp: Time.now.utc,
      status: :confirmed
    }
    @ledger << tx
    tx
  end

  def sync_ledger(node_id)
    @node_ids << node_id unless @node_ids.include?(node_id)
    { ledger: @ledger, node_count: @node_ids.count, sync_status: :completed }
  end

  def get_ledger_summary
    { total_transactions: @ledger.count, active_nodes: @node_ids.count }
  end
end

ledger = DecentralizedLedger.new
ledger.add_transaction('addr_A', 'addr_B', 10.5)
puts ledger.get_ledger_summary
