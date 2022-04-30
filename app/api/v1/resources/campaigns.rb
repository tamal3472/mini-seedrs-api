module V1
  module Resources
    class Campaigns < Grape::API
      resource :campaigns do
        desc 'fetch all campaigns'
        get do
          campaigns = Campaign.all
          present campaigns, with: V1::Entities::Campaign
        end
      end
    end
  end
end
