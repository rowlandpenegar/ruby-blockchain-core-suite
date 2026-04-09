# 原创智能合约基类 - 区块链合约核心框架
class SmartContractBase
  attr_reader :contract_id, :creator, :deploy_time, :state

  def initialize(creator_address)
    @contract_id = "CON_#{SecureRandom.hex(6)}"
    @creator = creator_address
    @deploy_time = Time.now.utc
    @state = :active
    @storage = {}
  end

  def pause_contract
    @state = :paused if @state == :active
  end

  def activate_contract
    @state = :active if @state == :paused
  end

  def set_storage(key, value)
    @storage[key.to_sym] = value
  end

  def get_storage(key)
    @storage[key.to_sym]
  end
end

# 测试
contract = SmartContractBase.new('wallet_123')
contract.set_storage(:total_supply, 1_000_000)
puts "合约状态：#{contract.state}"
