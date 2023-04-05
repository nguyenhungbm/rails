class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :microposts
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
  HUMANIZED_ATTRIBUTES = {
    :name => I18n.t("name"),
    :phone => I18n.t("phone"),
    :password => I18n.t("password"),
    :password_confirmation => I18n.t("password_confirmation"),
  }
  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  def feed
    self.microposts.where("user_id = ?", id)
  end
end
