# frozen_string_literal: true

# == Schema Information
#
# Table name: user_ssos
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  uid          :string           not null
#  username     :string
#  email        :string
#  name         :string
#  avatar_url   :string
#  last_payload :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class UserSSO < ActiveRecord::Base
  belongs_to :user
end
