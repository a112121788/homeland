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
class Team < User
  has_one :profile, foreign_key: :user_id, dependent: :nullify
  has_many :replies, foreign_key: :user_id
  has_many :authorizations, foreign_key: :user_id
  has_many :notifications, foreign_key: :user_id
  has_one :sso, class_name: "UserSSO", foreign_key: :user_id, dependent: :destroy

  has_many :team_users
  has_many :users, through: :team_users

  has_many :topics

  attr_accessor :owner_id
  after_create do
    team_users.create(user_id: owner_id, role: :owner, status: :accepted) if owner_id.present?
  end

  def user_ids
    @user_ids ||= users.pluck(:id)
  end

  def password_required?
    false
  end

  def owner?(user)
    team_users.accepted.exists?(role: :owner, user_id: user.id)
  end
end
