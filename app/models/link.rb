# frozen_string_literal: true

# Model Link
class Link < ApplicationRecord
  belongs_to :user, optional: true # Prevent ActiveRecord::RecordInvalid

  validates :url, presence: true, length: { minimun: 5 }
  validates :description, presence: true, length: { minimun: 5 }

  has_many :votes
end
