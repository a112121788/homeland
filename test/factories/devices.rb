# frozen_string_literal: true

# == Schema Information
#
# Table name: devices
#
#  id              :integer          not null, primary key
#  platform        :integer          not null
#  user_id         :integer          not null
#  token           :string           not null
#  last_actived_at :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :device do
    platform { 1 }
    association :user
    token { SecureRandom.hex }
  end
end
