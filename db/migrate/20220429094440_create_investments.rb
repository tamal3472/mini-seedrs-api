class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments, id: :bigserial do |t|
      t.decimal :investment_amount, precision: 23, scale: 4, null: false
      t.references :campaign, index: true, foreign_key: true, null: false, type: :bigint
      t.timestamps
    end
  end
end
