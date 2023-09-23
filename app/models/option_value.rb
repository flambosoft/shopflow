class OptionValue < ApplicationRecord
  belongs_to :option
  validates :value, presence: true
end
