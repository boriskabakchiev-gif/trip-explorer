class Trip < ApplicationRecord
  validates :name, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :short_description, presence: true
  validates :long_description, presence: true
end