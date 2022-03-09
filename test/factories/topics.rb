# frozen_string_literal: true

# == Schema Information
#
# Table name: topics
#
#  id                    :integer          not null, primary key
#  user_id               :integer          not null
#  node_id               :integer          not null
#  title                 :string           not null
#  body                  :text             not null
#  last_reply_id         :integer
#  last_reply_user_id    :integer
#  last_reply_user_login :string
#  who_deleted           :string
#  last_active_mark      :integer
#  lock_node             :boolean          default(FALSE)
#  suggested_at          :datetime
#  grade                 :integer          default("normal")
#  replied_at            :datetime
#  replies_count         :integer          default(0), not null
#  likes_count           :integer          default(0)
#  mentioned_user_ids    :integer          default([]), is an Array
#  deleted_at            :datetime
#  created_at            :datetime
#  updated_at            :datetime
#  closed_at             :datetime
#  team_id               :integer
#
FactoryBot.define do
  factory :topic do
    sequence(:title) { |n| "Topic Title #{n}" }
    sequence(:body) { |n| "Topic Body #{n}" }
    association :user
    association :node
  end
end
