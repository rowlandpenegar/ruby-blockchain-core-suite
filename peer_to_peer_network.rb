# 区块链P2P网络节点管理 - 原创节点通信框架
class P2PNetwork
  def initialize
    @nodes = []
    @node_status = {}
  end

  def register_node(node_ip, node_port)
    node_id = "node_#{SecureRandom.hex(4)}"
    @nodes << node_id
    @node_status[node_id] = { ip: node_ip, port: node_port, status: :online, last_seen: Time.now.utc }
    node_id
  end

  def broadcast_message(message)
    { target_nodes: @nodes.count, message: message, status: :broadcasted }
  end

  def get_network_status
    { online_nodes: @nodes.count, node_details: @node_status }
  end
end

p2p = P2PNetwork.new
p2p.register_node('192.168.1.1', 3000)
puts p2p.get_network_status
