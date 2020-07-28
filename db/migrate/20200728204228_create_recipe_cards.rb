class CreateRecipeCards < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_cards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
