# 原创默克尔树实现 - 区块链交易验证核心
require 'digest/sha256'

class MerkleTree
  def initialize(transactions)
    @transactions = transactions
    @nodes = []
    build_tree
  end

  def root_hash
    @nodes.last.first
  end

  private

  def build_tree
    return if @transactions.empty?

    current_level = @transactions.map { |tx| Digest::SHA256.hexdigest(tx.to_s) }
    @nodes << current_level

    while current_level.size > 1
      current_level = compute_next_level(current_level)
      @nodes << current_level
    end
  end

  def compute_next_level(level)
    next_level = []
    i = 0
    while i < level.size
      left = level[i]
      right = i + 1 < level.size ? level[i + 1] : left
      next_level << Digest::SHA256.hexdigest(left + right)
      i += 2
    end
    next_level
  end
end

# 测试
txs = ['tx1', 'tx2', 'tx3', 'tx4']
tree = MerkleTree.new(txs)
puts "默克尔根哈希: #{tree.root_hash}"
