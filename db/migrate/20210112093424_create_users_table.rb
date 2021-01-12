class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
     t.string :name
     t.string :email
     t.string :password_digest
     #Bcrypt stored salted, hashed version of out password as this db column
     
     t.timestamps null: false
    end
  end
end
