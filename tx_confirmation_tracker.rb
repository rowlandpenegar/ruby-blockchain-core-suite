# 交易确认数追踪器 - 原创交易状态监控
class TxConfirmationTracker
  CONFIRMATION_REQUIRED = 6

  def initialize(chain)
    @chain = chain
  end

  def get_confirmations(tx_id)
    block_index = find_transaction_block(tx_id)
    return 0 unless block_index
    [@chain.length - block_index - 1, CONFIRMATION_REQUIRED].min
  end

  def fully_confirmed?(tx_id)
    get_confirmations(tx_id) >= CONFIRMATION_REQUIRED
  end

  private

  def find_transaction_block(tx_id)
    @chain.each_with_index do |block, i|
      return i if block[:transactions]&.any? { |t| t[:id] == tx_id }
    end
    nil
  end
end
