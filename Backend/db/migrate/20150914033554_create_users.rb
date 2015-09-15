class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest
      t.boolean :admin, default: false, null: false
      t.string :provider
      t.string :uid
      t.string :token
      t.string :expires
      t.string :picture
      t.string :jwt

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
