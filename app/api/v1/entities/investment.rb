module V1
  module Entities
    class Investment < Grape::Entity
      expose :investment_amount
      expose :invested_campaign

      def invested_campaign
        campaign = object.campaign
        {
          campaign_name: campaign.name,
          campaign_id: campaign.id,
        }
      end
    end
  end
end
