class AddPercentageRaisedToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :percentage_raised, :decimal, null: false, precision: 5, scale: 2, default: 0.0
  end
end
