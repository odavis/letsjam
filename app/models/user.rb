class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :bands

  after_create :build_user_profile, :build_user_bands

  private

  #  create user profile
  def build_user_profile
    profile = Profile.create(user: self)
    profile.save(:validate => false)
    Band.create(profile_id: profile.id)
  end

  def build_user_bands

  end

end
