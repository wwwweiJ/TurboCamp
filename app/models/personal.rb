# frozen_string_literal: true

class Personal < ApplicationRecord
  belongs_to :user
  belongs_to :project
end
