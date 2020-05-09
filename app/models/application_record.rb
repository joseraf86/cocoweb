class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  FRAMEWORK_ATTRS = %w(id created_at updated_at)
end
