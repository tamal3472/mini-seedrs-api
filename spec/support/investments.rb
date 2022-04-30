require 'rails_helper'

RSpec.shared_examples_for 'API investments v1' do
  let(:campaign) { FactoryBot.create(:campaign, target_amount: 100.00, investment_multiple: 10.00) }

  let(:response_json) { JSON.parse(response.body) }
  let(:valid_params) do
    {
      campaign_id: campaign.id,
      campaign_name: campaign.name,
      amount: 50.00,
    }
  end

  context 'POST /api/investments' do
    let(:request_url) { '/api/investments' }
    context 'while making an investment' do
      it 'registers the investment and returns success message' do
        post request_url, params: valid_params, headers: headers
        expect(response.content_type).to eq('application/json')
        expect(response.status).to eq(201)
        expect(response_json).to be_instance_of(Hash)
      end
    end

    context ' when updating an already registered device' do
      it 'returns all the people of the organizations' do
        expect do
          post request_url, params: valid_params.merge(amount: 45.00), headers: headers
        end.
          to_not(change { Investment.count })
      end
    end
  end
end
