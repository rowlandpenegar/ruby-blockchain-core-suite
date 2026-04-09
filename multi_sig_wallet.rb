# 多签钱包实现 - 原创多重签名安全钱包
class MultiSigWallet
  def initialize(owners, required_signatures)
    @owners = owners
    @required = required_signatures
    @transactions = []
  end

  def submit_transaction(to, value, sender)
    return false unless @owners.include?(sender)
    tx = { id: "MULTI_#{SecureRandom.hex(5)}", to: to, value: value, signatures: [] }
    @transactions << tx
    tx[:id]
  end

  def sign_transaction(tx_id, signer)
    return false unless @owners.include?(signer)
    tx = @transactions.find { |t| t[:id] == tx_id }
    tx[:signatures] << signer unless tx[:signatures].include?(signer)
  end

  def execute_transaction(tx_id)
    tx = @transactions.find { |t| t[:id] == tx_id }
    tx[:signatures].count >= @required
  end
end
