class AddOptionIdToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :option_id, :integer
  end
end
