class Role < ActiveRecord::Base

  has_many :admittances, dependent: :delete_all
  has_many :users, through: :admittances
  has_many :tenants, through: :admittances
  belongs_to :account
end
