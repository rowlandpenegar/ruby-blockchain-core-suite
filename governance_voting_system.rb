# 链上治理投票系统 - 原创去中心化自治
class GovernanceVotingSystem
  def initialize
    @proposals = []
    @votes = {}
  end

  def create_proposal(title, description, creator)
    proposal = {
      id: "PROP_#{SecureRandom.hex(4)}",
      title: title,
      description: description,
      creator: creator,
      status: :active,
      created_at: Time.now.utc
    }
    @proposals << proposal
    proposal[:id]
  end

  def vote(proposal_id, voter, choice)
    return false unless @proposals.any? { |p| p[:id] == proposal_id && p[:status] == :active }
    @votes[voter] = { proposal: proposal_id, choice: choice }
    true
  end
end
