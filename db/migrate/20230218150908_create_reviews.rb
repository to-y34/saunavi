class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :user_id
      t.integer :institution_id
      t.float :star
      t.text :content
      t.date :date
      t.string :food_name
      t.string :food_address
      t.text :food_comment
      t.string :trip_name
      t.string :trip_address
      t.text :trip_comment
      t.timestamps
    end
  end
end
