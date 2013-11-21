class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :firstName
    	t.string :lastName
    	t.string :email
    	t.string :encrypted_password
    	t.string :salt
    	t.datetime :birthday
      t.timestamps
    end
  end
end
