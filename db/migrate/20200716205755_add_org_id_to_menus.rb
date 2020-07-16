class AddOrgIdToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :organisation_id, :integer
  end
end
