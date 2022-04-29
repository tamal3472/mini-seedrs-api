class Campaign < ApplicationRecord
  has_one_attached :image
  has_many :investments
  validates_presence_of :name, :target_amount, :investment_multiple
  validate :storable_image

  def storable_image
    return unless image.attached?

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:image, 'must be a JPEG or PNG') unless acceptable_types.include?(image.content_type)
  end
end
