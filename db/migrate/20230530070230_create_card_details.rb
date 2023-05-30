class CreateCardDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :card_details do |t|
      t.string :card_number
      t.string :exp_month
      t.string :exp_year
      t.string :cvv
      t.integer :card_type
      t.integer :user_id

      t.timestamps
    end
  end
end
