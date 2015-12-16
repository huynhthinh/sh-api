class CreateUsergroups < ActiveRecord::Migration
  def change
    create_table :usergroups do |t|
      t.string :name
      t.boolean :is_enabled, :default => true
      t.boolean :is_deleted
      t.belongs_to :account

      t.timestamps null: false
    end
  end
end
