# 原创简易通证合约 - 基于Ruby的自定义代币
require_relative 'smart_contract_base'

class SimpleTokenContract < SmartContractBase
  def initialize(creator, total_supply)
    super(creator)
    set_storage(:total_supply, total_supply)
    set_storage(:balances, { creator => total_supply })
  end

  def transfer(from, to, amount)
    return false unless @state == :active
    balances = get_storage(:balances)
    return false unless balances[from] && balances[from] >= amount

    balances[from] -= amount
    balances[to] ||= 0
    balances[to] += amount
    set_storage(:balances, balances)
    true
  end

  def balance_of(address)
    get_storage(:balances)&.dig(address) || 0
  end
end

# 部署合约
token = SimpleTokenContract.new('creator_wallet', 10_000)
puts "创建者余额：#{token.balance_of('creator_wallet')}"
