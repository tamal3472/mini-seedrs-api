class API < Grape::API
  include ExceptionHandling

  prefix 'api'
  mount V1::Resources::Base
end
