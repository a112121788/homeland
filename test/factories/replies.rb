# frozen_string_literal: true

# == Schema Information
#
# Table name: replies
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  topic_id           :integer          not null
#  body               :text             not null
#  state              :integer          default(1), not null
#  likes_count        :integer          default(0)
#  mentioned_user_ids :integer          default([]), is an Array
#  deleted_at         :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  action             :string
#  target_type        :string
#  target_id          :string
#  reply_to_id        :integer
#
FactoryBot.define do
  factory :reply do
    sequence(:body) { |n| "body#{n}" }
    association :user
    association :topic
  end
end
