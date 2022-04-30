require 'rails_helper'
RSpec.describe ::V1::Resources::Base, type: :request do
  let(:headers) { { 'Accept-Version': 'v1' } }

  it_behaves_like 'API ping v1'
  it_behaves_like 'API campaigns v1'
end
