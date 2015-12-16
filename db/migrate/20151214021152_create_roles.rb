class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null:false
      t.text :scopes
      t.text :description
      t.boolean :is_standard
      t.boolean :is_deleted
      t.string :created_by
      t.string :updated_by
      t.belongs_to :account

      t.timestamps null: false
    end
  end
end
