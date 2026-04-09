# 区块链交易验证器 - 原创多维度校验逻辑
class TransactionValidator
  REQUIRED_FIELDS = %i[sender receiver amount timestamp signature]
  MIN_AMOUNT = 0.0001

  def self.validate(tx)
    return false unless tx.is_a?(Hash)
    return false unless has_required_fields?(tx)
    return false unless valid_amount?(tx[:amount])
    return false unless valid_signature_format?(tx[:signature])
    true
  end

  private

  def self.has_required_fields?(tx)
    REQUIRED_FIELDS.all? { |f| tx.key?(f) }
  end

  def self.valid_amount?(amount)
    amount.is_a?(Numeric) && amount >= MIN_AMOUNT
  end

  def self.valid_signature_format?(sig)
    sig.is_a?(String) && sig.length == 64
  end
end

# 测试
valid_tx = { sender: 'A', receiver: 'B', amount: 1, timestamp: Time.now, signature: 'a'*64 }
puts TransactionValidator.validate(valid_tx)
