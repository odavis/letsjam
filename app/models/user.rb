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
#  firstName              :string(255)
#  lastName               :string(255)
#  location               :text
#  birthdate              :date
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

  after_create :build_user_profile, :build_user_bands

  def full_name
    firstName + " " + lastName
  end

  def gravatar
    stripped_email = email.strip
    downcased_email = email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)
    "http://gravatar.com/avatar/#{hash}"
  end

  private

  def build_user_profile
    profile = Profile.create(user: self)
    profile.save(:validate => false)
  end

  def build_user_bands
    Band.create(profile_id: profile.id)
    Band.save(:validate => false)
  end


end
