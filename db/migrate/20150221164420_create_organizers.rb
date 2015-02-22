class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :tel_1
      t.string :tel_2
      t.timestamps null: false
    end
  end
end
