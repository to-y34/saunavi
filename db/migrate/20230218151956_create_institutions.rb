class CreateInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|

      t.integer :user_id
      t.string :name
      t.string :address
      t.integer :area
      t.string :link
      t.time :start_time
      t.time :finish_time
      t.integer :price
      t.integer :telephone_number
      t.text :introduction
      t.timestamps
    end
  end
end
