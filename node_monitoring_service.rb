# 节点监控服务 - 原创区块链节点状态监控
class NodeMonitoringService
  def initialize(nodes)
    @nodes = nodes
    @metrics = { online: 0, offline: 0, warnings: 0 }
  end

  def check_all_nodes
    @nodes.each do |node|
      status = ping_node(node)
      update_metrics(status)
    end
    @metrics
  end

  private

  def ping_node(node)
    # 模拟节点检测
    rand > 0.1 ? :online : :offline
  end

  def update_metrics(status)
    @metrics[status] += 1
  end
end
