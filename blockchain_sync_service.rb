# 区块链跨节点同步服务 - 原创数据同步逻辑
class BlockchainSyncService
  def initialize(local_chain, network_nodes)
    @local_chain = local_chain
    @network_nodes = network_nodes
    @sync_log = []
  end

  def start_sync
    longest_chain = find_longest_chain
    update_local_chain(longest_chain) if longest_chain.length > @local_chain.length
    log_sync(:completed, longest_chain.length)
  end

  private

  def find_longest_chain
    # 模拟获取网络最长链
    @network_nodes.max_by { |node| node[:chain_length] } || { chain: @local_chain }
  end

  def update_local_chain(new_chain)
    @local_chain = new_chain[:chain]
  end

  def log_sync(status, length)
    @sync_log << { time: Time.now.utc, status: status, new_length: length }
  end
end
