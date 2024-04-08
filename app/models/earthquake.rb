class Earthquake < ApplicationRecord
  self.inheritance_column = :_type_disabled
  has_many :comments
end
