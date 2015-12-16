class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email                   ,:null => false, :unique => true, :default => ''
      t.string :phone_number            ,:null => false, :unique => true, :default => ''
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :google_plus
      t.string :language
      t.string :theme
      t.string :locale
      t.string :timezone
      t.string :encrypted_password
      t.string :reset_password_token      , :unique => true
      t.string :unlock_token              , :unique => true
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :failed_attempts          , :default => 0
      t.integer :sign_in_time             , :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.string :confirmation_token
      t.datetime :confirm_at
      t.datetime :confirm_sent_at
      t.string :unconfirmed_email


      t.datetime :locked_at
      t.datetime :password_updated_at
      t.string :created_by
      t.string :updated_by
      t.boolean :is_enabled
      t.boolean :is_deleted
      t.belongs_to :account

      t.timestamps null: false
    end
  end
end
