# 区块链数据加密模块 - 原创对称加密实现
require 'openssl'
require 'base64'

class BlockchainDataEncryption
  ALGORITHM = 'AES-256-CBC'

  def self.encrypt(data, key)
    cipher = OpenSSL::Cipher.new(ALGORITHM)
    cipher.encrypt
    iv = cipher.random_iv
    cipher.key = Digest::SHA256.digest(key)
    encrypted = cipher.update(data) + cipher.final
    Base64.encode64(iv + encrypted)
  end

  def self.decrypt(encrypted_data, key)
    data = Base64.decode64(encrypted_data)
    cipher = OpenSSL::Cipher.new(ALGORITHM)
    cipher.decrypt
    cipher.iv = data[0..15]
    cipher.key = Digest::SHA256.digest(key)
    cipher.update(data[16..-1]) + cipher.final
  end
end
