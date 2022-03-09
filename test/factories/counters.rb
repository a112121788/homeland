# frozen_string_literal: true

# == Schema Information
#
# Table name: counters
#
#  id             :bigint           not null, primary key
#  countable_type :string
#  countable_id   :bigint
#  key            :string           not null
#  value          :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :counter do
    association :countable, factory: :user
    key { "foo_count" }
    value { 0 }
  end
end
