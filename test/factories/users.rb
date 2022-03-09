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
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "name#{n}" }
    sequence(:login) { |n| "login#{n}" }
    sequence(:email) { |n| "email#{n}@gethomeland.com" }
    password { "password" }
    password_confirmation { "password" }
    location { "China" }
    created_at { 100.days.ago }
  end

  factory :avatar_user, parent: :user do
    avatar { File.open(Rails.root.join("test/fixtures/files/test.png")) }
  end

  factory :admin, parent: :user do
    state { "admin" }
  end

  factory :vip, parent: :user do
    state { "vip" }
  end

  factory :hr, parent: :user do
    state { "hr" }
  end

  factory :newbie, parent: :user do
    created_at { 1.hours.ago }
  end

  factory :blocked_user, parent: :user do
    created_at { 30.days.ago }
    state { "blocked" }
  end

  factory :deleted_user, parent: :user do
    created_at { 100.days.ago }
    state { "deleted" }
  end
end
