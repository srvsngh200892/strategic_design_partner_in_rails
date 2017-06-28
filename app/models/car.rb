class Car < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged
  validates :name, :max_speed, presence: true


end
