class ProcessInvestment
  attr_reader :campaign_id, :campaign_name, :investment_amount

  def self.call(campaign_id:, campaign_name:, investment_amount:)
    new(campaign_id: campaign_id, campaign_name: campaign_name, investment_amount: investment_amount).call
  end

  def initialize(campaign_id:, campaign_name:, investment_amount:)
    @campaign_id = campaign_id
    @campaign_name = campaign_name
    @investment_amount = investment_amount
  end

  def call
    return unless campaign.present?

    campaign.with_lock do
      Investment.create!(investment_amount: investment_amount, campaign: campaign)
    end
  end

  private

  def campaign
    return Campaign.find_by_name!(campaign_name) unless campaign_id.present?

    Campaign.find(campaign_id)
  end
end
