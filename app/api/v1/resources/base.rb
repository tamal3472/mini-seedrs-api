module V1
  module Resources
    class Base < Grape::API
      version %w(v1), using: :accept_version_header, strict: true
      format :json

      mount V1::Resources::Ping
      mount V1::Resources::Campaigns
      mount V1::Resources::Investments
    end
  end
end
