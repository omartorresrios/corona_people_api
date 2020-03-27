class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.integer :dni
      t.string :district
      t.string :infraction
      t.boolean :is_admin
      t.string :encrypted_password

      t.timestamps
    end
  end
end
