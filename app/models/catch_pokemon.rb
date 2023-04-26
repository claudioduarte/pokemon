class CatchPokemon < ApplicationRecord
  attr_accessor :sequence

  validates :sequence, presence: true
end
