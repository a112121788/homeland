# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  login                  :string(100)      not null
#  name                   :string(100)
#  email                  :string           not null
#  email_md5              :string           not null
#  email_public           :boolean          default(FALSE), not null
#  location               :string
#  location_id            :integer
#  bio                    :string
#  website                :string
#  company                :string
#  github                 :string
#  twitter                :string
#  avatar                 :string
#  state                  :integer          default("member"), not null
#  tagline                :string
#  created_at             :datetime
#  updated_at             :datetime
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  password_salt          :string           default(""), not null
#  persistence_token      :string           default(""), not null
#  single_access_token    :string           default(""), not null
#  perishable_token       :string           default(""), not null
#  topics_count           :integer          default(0), not null
#  replies_count          :integer          default(0), not null
#  type                   :string(20)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  team_users_count       :integer
#  followers_count        :integer          default(0)
#  following_count        :integer          default(0)
#
require "test_helper"

class TeamTest < ActiveSupport::TestCase
  test "base" do
    team = create(:team)
    assert_equal "Team", team.class.name
    assert_equal "Team", team[:type]
    assert_equal :team, team.user_type
  end

  test "Create" do
    team = build :team, password: nil, password_confirmation: nil

    assert_equal true, team.valid?
  end

  test "destroy" do
    team = create(:team)
    team.destroy
    assert_nil Team.find_by(id: team.id)
  end

  test ".owner? / .member?" do
    team = create(:team)
    team_owner = create(:team_owner, team: team)
    team_member = create(:team_member, team: team)

    assert_equal true, team.owner?(team_owner.user)
    assert_equal false, team.owner?(team_member.user)

    # should touch team when member changed
    old_updated_at = team.updated_at
    team.team_users.last.destroy!
    team.reload
    sleep 0.01
    refute_equal old_updated_at.to_f, team.updated_at.to_f

    old_updated_at = team.updated_at
    team.team_users.create!(user: create(:user))
    sleep 0.01
    team.reload
    refute_equal old_updated_at.to_f, team.updated_at.to_f
  end

  test "has_many" do
    user = create(:user)
    user1 = create(:user)
    team = create(:team, owner_id: user.id)
    create(:team_user, team: team, user: user1, role: :member)

    # topics should work
    create_list(:topic, 2, user: user, team_id: team.id)
    create_list(:topic, 1, user: user1, team_id: team.id)
    assert_equal 3, team.topics.count
    assert_includes_all team.topics.pluck(:id), *user.topics.pluck(:id)
    assert_includes_all team.topics.pluck(:id), *user1.topics.pluck(:id)
  end
end
