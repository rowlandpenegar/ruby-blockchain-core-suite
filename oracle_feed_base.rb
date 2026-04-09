# 预言机数据喂价基础模块 - 原创链下数据上链
class OracleFeedBase
  def initialize
    @data_feeds = {}
    @trusted_sources = []
  end

  def add_trusted_source(source_id)
    @trusted_sources << source_id unless @trusted_sources.include?(source_id)
  end

  def submit_data(source_id, key, value)
    return false unless @trusted_sources.include?(source_id)
    @data_feeds[key.to_sym] = { value: value, updated_at: Time.now.utc, source: source_id }
    true
  end

  def get_data(key)
    @data_feeds[key.to_sym]
  end
end
