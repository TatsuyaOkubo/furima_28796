class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }

    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }

    validates :birthday
  end
end
