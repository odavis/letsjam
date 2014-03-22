class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :bands, dependent: :destroy
  accepts_nested_attributes_for :bands, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true


def update_for_profile(profile_params)
  self.attributes = profile_params
  self.save
end

end
