class CreateShoppingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :ingredients, array: true, default: []

      t.timestamps
    end
  end
end
