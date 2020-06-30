class CreateMenuOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_options do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
