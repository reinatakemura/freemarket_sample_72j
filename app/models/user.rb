class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cards

  has_many :items

  has_one :profile

  has_one :address

  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/

  VALID_PASS_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i

  validates :nickname,        presence: true
  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana,  presence: true
  validates :email,           presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,        presence: true, length: { minimum: 7 }, format: { with: VALID_PASS_REGEX}
  validates :year,            presence: true
  validates :month,           presence: true
  validates :day,             presence: true

end
