require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { is_expected.to have_many(:investments).dependent(:destroy) }
  it { is_expected.to have_many(:investments) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :target_amount }
  it { is_expected.to validate_presence_of :investment_multiple }

  describe 'image upload' do
    context 'with a valid image' do
      let(:campaign) { FactoryBot.create(:campaign) }
      it 'saves the image' do
        campaign.image.attach(
          io: File.open('spec/fixtures/images/rails.png'),
          filename: 'rails_image',
          content_type: 'image/png',
        )
        expect(campaign.reload.image).to be_attached
      end
    end
  end
end
