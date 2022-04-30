class Investment < ApplicationRecord
  belongs_to :campaign
  validates_presence_of :campaign_id, :investment_amount
  validate :valid_investment
  after_save :update_campaign_raised_percentage

  def valid_investment
    return errors.add(:investment_amount, 'zero is not accepted') unless investment_amount > 0.0

    investment_factor = investment_amount % campaign.investment_multiple

    errors.add(:investment_amount, 'invalid amount') unless investment_factor.zero?
  end

  private

  def update_campaign_raised_percentage
    campaign_raised_percentage = campaign.percentage_raised
    percentage_for_this_investment = investment_amount / campaign.target_amount
    total_percentage_raised = campaign_raised_percentage + percentage_for_this_investment

    campaign.update!(percentage_raised: total_percentage_raised)
  end
end
