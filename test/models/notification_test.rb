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
require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  test ".realtime_push_to_client" do
    note = create(:notification_topic_reply)

    hash = {}
    hash[:count] = note.user.notifications.unread.count
    args = ["notifications_count/#{note.user_id}", hash]
    ActionCable.server.expects(:broadcast).with(*args).once
    note.realtime_push_to_client
  end
end
