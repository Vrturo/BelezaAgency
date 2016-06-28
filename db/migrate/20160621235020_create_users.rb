class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :admin,:default => :false
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.date :dob
      t.string :gender
      t.string :language_one
      t.string :language_two
      t.string :height
      t.integer :age
      t.string :shirt_size
      t.string :dress_size
      t.integer :pant_size
      t.integer :shoe_size
      t.string :website
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :phone_number

      t.timestamps null: false
    end
  end
end
