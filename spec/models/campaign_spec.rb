require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { is_expected.to have_many(:investments).dependent(:destroy) }
  it { is_expected.to have_many(:investments) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :target_amount }
  it { is_expected.to validate_presence_of :investment_multiple }
end
