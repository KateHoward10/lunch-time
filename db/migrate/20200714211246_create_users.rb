class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :google_token
      t.string :google_refresh_token

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
