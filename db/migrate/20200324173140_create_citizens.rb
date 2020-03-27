class CreateCitizens < ActiveRecord::Migration[6.0]
  def change
    create_table :citizens do |t|
      t.string :name
      t.string :avatar
      t.string :dni
      t.string :district
      t.string :infraction

      t.timestamps
    end
  end
end
