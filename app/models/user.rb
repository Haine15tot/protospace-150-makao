class User < ApplicationRecord
  has_many :prototypes
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, presence: true
  validates :affiliation, presence: true
  validates :position, presence: true
end
