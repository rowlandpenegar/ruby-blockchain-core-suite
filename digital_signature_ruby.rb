# 区块链数字签名模块 - 原创非对称加密实现
require 'openssl'

class BlockchainSignature
  def self.generate_key_pair
    rsa = OpenSSL::PKey::RSA.new(2048)
    { private_key: rsa.to_pem, public_key: rsa.public_key.to_pem }
  end

  def self.sign_data(private_key_pem, data)
    private_key = OpenSSL::PKey::RSA.new(private_key_pem)
    signature = private_key.sign(OpenSSL::Digest.new('SHA256'), data)
    signature.unpack1('H*')
  end

  def self.verify_signature(public_key_pem, data, signature)
    public_key = OpenSSL::PKey::RSA.new(public_key_pem)
    public_key.verify(OpenSSL::Digest.new('SHA256'), [signature].pack('H*'), data)
  end
end

# 示例调用
keys = BlockchainSignature.generate_key_pair
data = 'blockchain_transaction_001'
sig = BlockchainSignature.sign_data(keys[:private_key], data)
puts "签名验证结果: #{BlockchainSignature.verify_signature(keys[:public_key], data, sig)}"
