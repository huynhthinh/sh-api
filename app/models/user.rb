class User < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  # Include default devise modules.
  # devise :database_authenticatable, :registerable,
  #         :recoverable, :rememberable, :trackable, :validatable,
  #         :confirmable, :omniauthable
  # include DeviseTokenAuth::Concerns::User

  ## Token Authenticatable

  # field :authentication_token

  has_many :admittances, dependent: :delete_all
  has_many :roles, through: :admittances
  has_many :tenants, through: :admittances
  has_and_belongs_to_many :usergroups, join_table: :users_usergroups
  belongs_to :account
end
