# frozen_string_literal: true

# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  image      :string           not null
#  created_at :datetime
#  updated_at :datetime
#
class Photo < ApplicationRecord
  belongs_to :user, optional: true

  mount_uploader :image, PhotoUploader
  after_commit :remove_image!, on: :destroy
end
