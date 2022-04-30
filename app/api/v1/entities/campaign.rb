module V1
  module Entities
    class Campaign < Grape::Entity
      include Rails.application.routes.url_helpers
      expose :id
      expose :name
      expose :target_amount
      expose :country
      expose :sector
      expose :percentage_raised
      expose :investment_multiple
      expose :image_url

      def image_url
        rails_blob_path(object.image, only_path: true) if object.image.attached?
      end

      def percentage_raised
        "#{object.percentage_raised * 100.00} %"
      end
    end
  end
end
