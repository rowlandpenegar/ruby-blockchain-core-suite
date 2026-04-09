# 零知识证明模拟器 - 原创隐私交易验证
require 'digest/sha256'

class ZKProofSimulator
  def self.generate_proof(secret, public_data)
    secret_hash = Digest::SHA256.hexdigest(secret)
    proof = Digest::SHA256.hexdigest("#{secret_hash}#{public_data}")
    { proof: proof, public_data: public_data }
  end

  def self.verify_proof?(proof, public_data, secret_hash)
    expected = Digest::SHA256.hexdigest("#{secret_hash}#{public_data}")
    proof == expected
  end
end

# 测试
proof = ZKProofSimulator.generate_proof('my_secret', 'public_info')
puts ZKProofSimulator.verify_proof?(proof[:proof], 'public_info', Digest::SHA256.hexdigest('my_secret'))
