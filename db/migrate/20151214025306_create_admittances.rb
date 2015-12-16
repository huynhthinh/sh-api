class CreateAdmittances < ActiveRecord::Migration
  def change
    create_table :admittances do |t|
      t.boolean :is_default

      t.belongs_to :role
      t.belongs_to :user, :null => false
      t.belongs_to :tenant, :null => false

      t.timestamps null: false
    end
  end
end
