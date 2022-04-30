require 'rails_helper'

RSpec.describe ProcessInvestment do
  let(:campaign) { FactoryBot.create(:campaign, target_amount: 100.00, investment_multiple: 10.00) }
  let(:instance) do
    described_class.new(campaign_id: campaign.id, campaign_name: campaign.name, investment_amount: 50.00)
  end

  describe '#call' do
    it 'create investment for the campaign' do
      expect(Investment.count).to eq(0)
      instance.call
      expect(Investment.count).to eq(1)
      expect(campaign.investments.count).to eq(1)
    end
  end
end
