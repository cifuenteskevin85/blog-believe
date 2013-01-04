class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :full_name, :avatar

  has_attached_file :avatar,
            styles: {medium: "256x320>", thumb: "60x80" },
            url: "/assets/avatars/:id/:style/:basename.:extension",
            path: ":rails_root/public/assets/avatars/:id/:style/:basename.:extension"
  validates_attachment :avatar,
            content_type: {content_type: ["image/jpg", "image/jpeg", "image/png"]},
            size: {less_than: 3.megabytes}
  # attr_accessible :title, :body
  has_many :posts
end