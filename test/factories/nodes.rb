# frozen_string_literal: true

# == Schema Information
#
# Table name: nodes
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  summary      :string
#  sort         :integer          default(0), not null
#  topics_count :integer          default(0), not null
#  created_at   :datetime
#  updated_at   :datetime
#
FactoryBot.define do
  factory :node do
    sequence(:name) { |n| "name#{n}" }
    summary { "summary" }
  end
end
