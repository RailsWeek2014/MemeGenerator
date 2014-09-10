class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #attr_accessor :username

  acts_as_liker
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "may only contain letters and numbers." }

  has_many :memes
  has_many :meme_templates

end
