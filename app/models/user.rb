class User < ApplicationRecord
  has_many :groups
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { in: 1..15 }
  validates :lastname, presence: true, length: { in: 1..15 }
end
