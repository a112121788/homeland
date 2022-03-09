# frozen_string_literal: true

# == Schema Information
#
# Table name: nodes
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  summary      :string
#  sort         :integer          default(0), not null
#  topics_count :integer          default(0), not null
#  created_at   :datetime
#  updated_at   :datetime
#
class Node < ApplicationRecord
  second_level_cache expires_in: 2.weeks

  has_many :topics

  validates :name, presence: true
  validates :name, uniqueness: true

  scope :hots, -> { order(topics_count: :desc) }
  scope :sorted, -> { order(sort: :desc) }

  form_select :name

  def self.find_builtin_node(id, name)
    node = find_by_id(id)
    return node if node
    create(id: id, name: name)
  end

  def collapse_summary?
    @collapse_summary ||= summary_html.scan(/<p>|<ul>/).size > 2
  end

  def summary_html
    Rails.cache.fetch("#{cache_key_with_version}/summary_html") do
      Homeland::Markdown.call(summary || "")
    end
  end
end
