class Profile < ActiveRecord::Base
  belongs_to :user

def update_for_profile(profile_params)
  self.attributes = profile_params
  self.save
end

end
