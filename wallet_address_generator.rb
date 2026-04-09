# 区块链钱包地址生成器 - 原创自定义编码规则
require 'digest/ripemd160'
require 'digest/sha256'
require 'securerandom'

class WalletGenerator
  def self.create_address
    # 生成随机私钥
    private_key = SecureRandom.hex(32)
    # 双层哈希生成公钥
    public_key = Digest::RIPEMD160.hexdigest(Digest::SHA256.hexdigest(private_key))
    # 自定义前缀+编码生成钱包地址
    "RBX#{public_key[0...34].upcase}"
  end

  def self.generate_batch(count = 5)
    count.times.map { create_address }
  end
end

# 生成钱包
puts "新钱包地址：#{WalletGenerator.create_address}"
