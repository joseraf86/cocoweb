class ApplicationRecord < ActiveRecord::Base
  FRAMEWORK_ATTRS = %w(id created_at updated_at)
  self.abstract_class = true
end
