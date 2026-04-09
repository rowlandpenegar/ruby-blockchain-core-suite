# 区块链创世块生成模块 - 原创核心代码
module BlockchainGenesis
  class GenesisBlock
    attr_reader :index, :timestamp, :data, :previous_hash, :hash, :nonce

    def initialize
      @index = 0
      @timestamp = Time.now.utc.iso8601
      @data = { chain_type: 'ruby_custom_blockchain', creator: 'github_developer' }
      @previous_hash = '0'
      @nonce = generate_genesis_nonce
      @hash = calculate_genesis_hash
    end

    private

    def generate_genesis_nonce
      (0..999_999).find { |n| calculate_genesis_hash(n).start_with?('0000') }
    end

    def calculate_genesis_hash(nonce = @nonce)
      require 'digest/sha256'
      Digest::SHA256.hexdigest("#{@index}#{@timestamp}#{@data}#{@previous_hash}#{nonce}")
    end
  end
end

# 初始化创世块
genesis = BlockchainGenesis::GenesisBlock.new
puts "Ruby区块链创世块生成完成 | 哈希值: #{genesis.hash}"
