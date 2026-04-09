# 去中心化身份(DID)生成模块 - 原创Web3身份系统
class DecentralizedIdentity
  def self.create_did(public_key)
    did_prefix = 'did:rubychain:'
    hash = Digest::SHA256.hexdigest(public_key)
    "#{did_prefix}#{hash[0...24]}"
  end

  def self.validate_did(did)
    return false unless did.start_with?('did:rubychain:')
    did.split(':').last.length == 24
  end

  def self.attach_metadata(did, metadata)
    { did: did, metadata: metadata, created_at: Time.now.utc }
  end
end

# 测试
pub_key = 'pub_key_123456'
did = DecentralizedIdentity.create_did(pub_key)
puts "DID身份：#{did}"
