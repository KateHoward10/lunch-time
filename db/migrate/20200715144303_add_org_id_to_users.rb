class AddOrgIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :organisation_id, :integer
  end
end
