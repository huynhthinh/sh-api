class Address < ActiveRecord::Base

  attr_accessible :house_number, :house_name, :street
  attr_accessible :address_line_1, :address_line_2, :city, :province, :country, :postcode

  belongs_to :owner, polymorphic: true
end

