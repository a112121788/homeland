# frozen_string_literal: true

# == Schema Information
#
# Table name: search_documents
#
#  id              :bigint           not null, primary key
#  searchable_type :string(32)       not null
#  searchable_id   :integer          not null
#  tokens          :tsvector
#  content         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class SearchDocumentTest < ActiveSupport::TestCase
end
