class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :house_number
      t.string :house_name
      t.string :street
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :province
      t.string :country
      t.string :postcode
      t.references :owner, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
