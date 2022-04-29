module V1
  module Resources
    class Ping < Grape::API
      desc 'Returns Pong with Server Time to check API is running of not'
      get :ping do
        { pong: Date.today.strftime('%D') }
      end
    end
  end
end
