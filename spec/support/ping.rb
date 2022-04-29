require 'rails_helper'

RSpec.shared_examples_for 'API ping v1' do
  describe 'GET /ping' do
    it 'searches on Meta for the given query' do
      get '/api/ping', headers: headers
      expect(response.content_type).to eq('application/json')
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq('pong' => Date.today.strftime('%D'))
    end
  end
end
