class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_null :users, :user_name, false
    change_column_null :users, :password_digest, false

    add_index :users, :user_name, unique: true
  end
end
