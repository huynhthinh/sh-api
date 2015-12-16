class User < ActiveRecord::Base

  has_many :admittances, dependent: :delete_all
  has_many :roles, through: :admittances
  has_many :tenants, through: :admittances
  has_and_belongs_to_many :usergroups, join_table: :users_usergroups
  belongs_to :account
end
