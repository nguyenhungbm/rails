class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :microposts, dependent: :destroy
  has_many :questionnaires, dependent: :destroy
  devise :timeoutable, :timeout_in => 15.minutes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save { email.downcase! }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  validates :name, presence: true, length: { in: 6..20 }
  validates :phone, presence: true, length: { maximum: 12 }
  validates :email, presence: true, format: Devise.email_regexp, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
