class Comment < ApplicationRecord
  belongs_to :earthquake
  belongs_to :user
end
