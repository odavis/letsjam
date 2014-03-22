# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  first                  :string(255)
#  last                   :string(255)
#  location               :text
#  age                    :integer
#  username               :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates_presence_of :first, :last, :username

  extend FriendlyId
  friendly_id :full_name, use: [:slugged, :history, :finders]

  has_one :profile
  has_many :bands

  after_create :build_user_profile, :build_user_bands, :set_full_name

  private

  def set_full_name
    binding.pry
    full_name = self.first + " " + self.last
    self.full_name = full_name
    self.save
  end

  def build_user_profile
    profile = Profile.create(user: self)
    profile.save(:validate => false)
    Band.create(profile_id: profile.id)
  end


end
