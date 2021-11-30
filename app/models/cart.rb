class Cart < ApplicationRecord

  has_one :user
  has_and_belongs_to_many :items

end
