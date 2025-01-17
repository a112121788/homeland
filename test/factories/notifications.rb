# frozen_string_literal: true

# == Schema Information
#
# Table name: notifications
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  actor_id           :integer
#  notify_type        :string           not null
#  target_type        :string
#  target_id          :integer
#  second_target_type :string
#  second_target_id   :integer
#  third_target_type  :string
#  third_target_id    :integer
#  read_at            :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
FactoryBot.define do
  factory :notification, class: Notification do
    notify_type { "foo" }
    association :user
    association :actor, factory: :user
  end
end
