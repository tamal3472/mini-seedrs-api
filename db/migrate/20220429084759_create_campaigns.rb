class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns, id: :bigserial do |t|
      t.string :name, null: false
      t.decimal :target_amount, precision: 23, scale: 4, null: false
      t.string :sector
      t.string :country
      t.decimal :investment_multiple, precision: 9, scale: 2, null: false
      t.index ['name'], unique: true
      t.timestamps
    end
  end
end
