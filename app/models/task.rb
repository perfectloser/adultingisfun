class Task < ActiveRecord::Base
  has_many :achievements
  has_many :users, through: :achievements
  
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :points, presence: true, numericality: { greater_than: 0 }

  def expired?
    Date.today > self.expiration
  end

  def current?
    Date.today < self.expiration
  end
end