module V1
  module Resources
    class Investments < Grape::API
      desc 'Invest in a campaign'
      resources :investments do
        params do
          optional :campaign_id, type: Integer
          requires :campaign_name, type: String
          requires :amount, type: BigDecimal
        end

        post do
          investment = ProcessInvestment.call(campaign_id: params[:campaign_id],
                                              campaign_name: params[:campaign_name],
                                              investment_amount: params[:amount])
          present investment, with: V1::Entities::Investment
        end
      end
    end
  end
end
