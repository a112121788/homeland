# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text             not null
#  user_id          :integer          not null
#  commentable_type :string
#  commentable_id   :integer
#  deleted_at       :datetime
#  created_at       :datetime
#  updated_at       :datetime
#
FactoryBot.define do
  factory :comment do
    body { "body" }
    association :user
    association :commentable
  end
end
