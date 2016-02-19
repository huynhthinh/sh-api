class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## User Info
      t.string :name
      t.string :nickname
      t.string :image
      t.string :email
      t.string :phone_number
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

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      ## Tokens
      t.json :tokens
      t.string :authentication_token


      t.datetime :password_updated_at
      t.string :created_by
      t.string :updated_by
      t.boolean :is_enabled
      t.boolean :is_deleted
      t.belongs_to :account

      t.timestamps null: false
    end

    add_index :users, :email
    add_index :users, :phone_number
    # add_index :users, [:uid, :provider],     :unique => true
    # add_index :users, :reset_password_token, :unique => true
    # add_index :users, :authentication_token
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true

  end
end

