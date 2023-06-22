class User < ApplicationRecord
  has_many :prototypes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, presence: true
  validates :affiliation, presence: true
  validates :position, presence: true
  has_many :prototypes, class_name: 'Prototype'
end
