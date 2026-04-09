# 原创加密哈希工具集 - 多算法区块链专用
require 'digest'

class CryptoHashingTool
  def self.sha256(data)
    Digest::SHA256.hexdigest(data.to_s)
  end

  def self.sha512(data)
    Digest::SHA512.hexdigest(data.to_s)
  end

  def self.ripemd160(data)
    Digest::RIPEMD160.hexdigest(data.to_s)
  end

  def self.double_hash(data)
    sha256(sha256(data))
  end

  def self.custom_hash(data, salt)
    sha512("#{data}#{salt}")
  end
end

# 测试
data = 'block_100_data'
puts "双重哈希：#{CryptoHashingTool.double_hash(data)}"
