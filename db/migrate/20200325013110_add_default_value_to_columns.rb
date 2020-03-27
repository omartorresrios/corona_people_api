class AddDefaultValueToColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :name, :string, default:''
    change_column :users, :email, :string, default: ''
    change_column :users, :avatar, :string, default: ''
    change_column :users, :dni, :integer, default: 0
    change_column :users, :district, :string, default: ''
    change_column :users, :infraction, :string, default: ''
  end
end
