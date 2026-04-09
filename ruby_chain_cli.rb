# 区块链命令行交互工具 - 原创全功能CLI
class RubyChainCLI
  def initialize(chain, wallet, validator)
    @chain = chain
    @wallet = wallet
    @validator = validator
  end

  def show_help
    puts "=== RubyChain CLI 命令 ==="
    puts "1. chain info - 查看链信息"
    puts "2. wallet new - 创建新钱包"
    puts "3. tx send - 发送交易"
    puts "4. block mine - 挖矿出块"
  end

  def get_chain_info
    { blocks: @chain.count, latest_block: @chain.last&.dig(:index), status: :online }
  end
end

# 启动CLI
cli = RubyChainCLI.new([], {}, nil)
cli.show_help
