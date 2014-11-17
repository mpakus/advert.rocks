module Sortable
  extend ActiveSupport::Concern

  included do
    scope :ordered, ->{ order('created_at DESC') }
  end
end

