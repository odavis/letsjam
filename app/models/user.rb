class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  after_create :build_user_profile

  private

  #  create user profile
  def build_user_profile
    profile = Profile.create(user: self)
    profile.save(:validate => false)
  end
end
