class Team < ApplicationRecord
  dragonfly_accessor :avatar
  has_and_belongs_to_many :apprentices
end
