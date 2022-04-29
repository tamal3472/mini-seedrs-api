class Investment < ApplicationRecord
  belongs_to :campaign
  validates_presence_of :campaign_id, :investment_amount
end
