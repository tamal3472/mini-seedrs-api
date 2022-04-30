require 'rails_helper'

RSpec.describe V1::Entities::Campaign do
  let(:campaign) { FactoryBot.create(:campaign) }
  let(:campaign_entity) { described_class.represent(campaign) }

  subject { JSON.parse(campaign_entity.to_json) }

  it 'matches the api specification' do
    expect(subject).
      to eq(
        'id' => campaign.id,
        'country' => campaign.country,
        'image_url' => nil,
        'investment_multiple' => campaign.investment_multiple.to_s,
        'name' => campaign.name,
        'percentage_raised' => campaign.percentage_raised.to_s,
        'sector' => campaign.sector,
        'target_amount' => campaign.target_amount.to_s,
      )
  end
end
