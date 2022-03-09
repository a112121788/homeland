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
FactoryBot.define do
  factory :photo do
    association :user
  end
end
