class Tenant < ActiveRecord::Base

  has_many :admittances, dependent: :delete_all
  has_many :users, through: :admittances, dependent: :delete_all
  has_many :addresses, as: :owner, dependent: :delete_all
  belongs_to :account
end
