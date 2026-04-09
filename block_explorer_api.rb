# 区块链浏览器API核心 - 原创链上数据查询
class BlockExplorerAPI
  def initialize(chain)
    @chain = chain
  end

  def get_block_by_index(index)
    @chain.find { |b| b[:index] == index }
  end

  def get_latest_block
    @chain.last
  end

  def search_transaction(tx_id)
    @chain.each do |block|
      tx = block[:transactions]&.find { |t| t[:id] == tx_id }
      return tx if tx
    end
    nil
  end

  def get_chain_stats
    { total_blocks: @chain.count, total_txs: @chain.sum { |b| b[:transactions]&.count || 0 } }
  end
end
