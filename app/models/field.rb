class Field < ActiveRecord::Base
  validates :name, :value,
    presence: true
end
