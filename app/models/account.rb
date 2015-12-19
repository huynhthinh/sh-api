class Account < ActiveRecord::Base

  # attr_accessible :uuid, :name, :account_type,  :email, :domain_name, :contact_person_name, :contact_person_email
  # attr_accessible :contact_person_phone, :logo, :is_deleted, :created_by, :updated_by,:created_at, :updated_at

  enum account_type: [:root, :distributor, :var, :customer]
  belongs_to :account

  has_many :addresses, as: :owner
  has_many :accounts, dependent: :delete_all
  has_many :tenants, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :usergroups, dependent: :destroy
  has_many :users, dependent: :destroy
end

