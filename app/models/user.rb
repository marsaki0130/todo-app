class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def avatar_image
    'Oval.png'
  end

  has_many :boards, dependent: :destroy #ユーザーがいて記事が紐づいてることを認識させる
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
end
