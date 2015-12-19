class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.uuid :uuid
      t.string :name
      t.integer :account_type, index: true
      t.string :email
      t.string :domain_name
      t.string :contact_person_name
      t.string :contact_person_email
      t.string :contact_person_phone
      t.string :logo
      t.boolean :is_deleted, default:false
      t.string :created_by
      t.string :updated_by
      t.belongs_to :account

      t.timestamps null: false
    end
  end
end
