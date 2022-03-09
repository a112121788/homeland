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
FactoryBot.define do
  factory :authorization do
    provider { "github" }
    sequence(:uid) { |n| "github-#{n}" }
    association(:user)
  end
end
