class ApplicationRecord < ActiveRecord::Base
  include Keys
  self.abstract_class = true
end
