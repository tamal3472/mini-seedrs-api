require 'rails_helper'

RSpec.describe V1::Entities::Investment do
  let(:campaign) { FactoryBot.create(:campaign, target_amount: 100.00, investment_multiple: 10.00) }
  let(:valid_investment) do
    FactoryBot.create(:investment, investment_amount: 50.00, campaign: campaign)
  end
  let(:investment_entity) { described_class.represent(valid_investment) }

  subject { JSON.parse(investment_entity.to_json) }

  it 'matches the api specification' do
    expect(subject).
      to eq(
        'investment_amount' => valid_investment.investment_amount.to_s,
        'invested_campaign' => { 'campaign_id' => campaign.id, 'campaign_name' => campaign.name },
      )
  end
end
