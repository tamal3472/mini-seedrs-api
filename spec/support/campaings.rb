require 'rails_helper'

RSpec.shared_examples_for 'API campaigns v1' do
  describe 'GET /campaigns' do
    let!(:campaign) { FactoryBot.create(:campaign) }
    it 'searches on Meta for the given query' do
      get '/api/campaigns', headers: headers
      expect(response.content_type).to eq('application/json')
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq(
        [
          {
            'country' => campaign.country,
            'image_url' => nil,
            'investment_multiple' => campaign.investment_multiple.to_s,
            'name' => campaign.name,
            'percentage_raised' => campaign.percentage_raised.to_s,
            'sector' => campaign.sector,
            'target_amount' => campaign.target_amount.to_s,
          },
        ],
      )
    end
  end
end
