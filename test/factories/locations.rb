# frozen_string_literal: true

# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  users_count :integer          default(0), not null
#  created_at  :datetime
#  updated_at  :datetime
#
FactoryBot.define do
  factory :location do
    sequence(:name) { |n| "name#{n}" }
  end
end
