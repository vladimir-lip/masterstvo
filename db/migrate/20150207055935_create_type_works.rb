class CreateTypeWorks < ActiveRecord::Migration
  def change
    create_table :type_works do |t|
			t.string 	:title	
      t.timestamps null: false
    end
  end
end
