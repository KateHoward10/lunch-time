class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
