require 'rails_helper'

RSpec.describe Investment, type: :model do
  let(:campaign) { FactoryBot.create(:campaign, target_amount: 100.00, investment_multiple: 10.00) }

  it { is_expected.to belong_to(:campaign) }
  it { is_expected.to validate_presence_of :investment_amount }
  it { is_expected.to validate_presence_of :campaign_id }

  describe '#valid_investment' do
    context 'with a invalid amount' do
      let(:invalid_investment) do
        FactoryBot.build(:investment, investment_amount: 45.00, campaign: campaign)
      end
      it 'should not validate' do
        expect(invalid_investment.valid?).to be_falsey
        expect(invalid_investment.errors[:investment_amount]).to eq(['invalid amount'])
      end
    end

    context 'with a 0 amount' do
      let(:invalid_investment) do
        FactoryBot.build(:investment, investment_amount: 0.00, campaign: campaign)
      end
      it 'should not validate' do
        expect(invalid_investment.valid?).to be_falsey
        expect(invalid_investment.errors[:investment_amount]).to eq(['zero is not accepted'])
      end
    end

    context 'with a valid amount' do
      let(:valid_investment) do
        FactoryBot.build(:investment, investment_amount: 50.00, campaign: campaign)
      end
      it 'should validate' do
        expect(valid_investment.valid?).to be_truthy
      end
    end
  end

  describe '#update_campaign_raised_percentage' do
    context 'when no investment has been made' do
      it 'no percentage raised' do
        expect(campaign.reload.percentage_raised).to eq(0.00)
      end
    end

    context 'with a valid amount' do
      let!(:valid_investment) do
        FactoryBot.create(:investment, investment_amount: 50.00, campaign: campaign)
      end
      it 'should raise the percentage' do
        expect(campaign.reload.percentage_raised).to eq(0.5)
      end
    end
  end
end
