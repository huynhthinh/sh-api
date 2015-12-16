class Account < ActiveRecord::Base
  belongs_to :account

  has_many :addresses, as: :owner
  has_many :accounts, dependent: :delete_all
  has_many :tenants, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :usergroups, dependent: :destroy
  has_many :users, dependent: :destroy
end
