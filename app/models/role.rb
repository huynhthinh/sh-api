class Role < ActiveRecord::Base

  has_many :admittances, dependent: :delete_all
  has_many :users, through: :admittances
  has_many :tenants, through: :admittances
  belongs_to :account

  def self.reset_pkey
    ActiveRecord::Base.connection.reset_pk_sequence!(self.name.downcase.pluralize)
  end

end
