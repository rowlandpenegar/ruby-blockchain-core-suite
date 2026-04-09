# NFT元数据处理器 - 原创链上元数据管理
require 'json'

class NFTMetadataHandler
  def self.create_metadata(token_id, name, description, image_url)
    {
      token_id: token_id,
      name: name,
      description: description,
      image: image_url,
      created_at: Time.now.utc,
      standard: 'rubychain-nft-1.0'
    }.to_json
  end

  def self.validate_metadata(metadata_json)
    data = JSON.parse(metadata_json)
    required = %w[token_id name image standard]
    required.all? { |k| data.key?(k) }
  end
end

# 测试
meta = NFTMetadataHandler.create_metadata(1, 'RubyNFT', 'First NFT', 'https://example.com/img.png')
puts "NFT元数据：#{meta}"
