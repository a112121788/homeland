# frozen_string_literal: true

# == Schema Information
#
# Table name: team_users
#
#  id         :integer          not null, primary key
#  team_id    :integer          not null
#  user_id    :integer          not null
#  role       :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :team_user do
    association :team
    association :user
    role { :member }
    status { :accepted }
  end

  factory :team_owner, parent: :team_user do
    role { :owner }
  end

  factory :team_member, parent: :team_user do
    role { :member }
  end
end
