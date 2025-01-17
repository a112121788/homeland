# frozen_string_literal: true

# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  provider   :string           not null
#  uid        :string(1000)     not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
class Authorization < ApplicationRecord
  belongs_to :user

  validates :uid, :provider, presence: true
  validates :uid, uniqueness: {scope: :provider}

  def self.find_user_by_provider(provider, uid)
    where(provider: provider, uid: uid).first&.user
  end

  def self.create_auth(auth, user)
    where(provider: auth.provider, uid: auth.uid).first_create do |item|
      item.user = user
    end
  end
end
