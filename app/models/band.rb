# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  profile_id :integer
#
# f73d640ce8d85dfd0efefeb0284cc686

after_update :find_similiar_artist

class Band < ActiveRecord::Base
  belongs_to :user

  # validates_precen
  # validates precencec of 5 bands
  # bands cannot be


  def find_similiar_artist
    self.name
  end
end
