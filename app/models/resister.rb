class Resister < ActiveRecord::Base
  belongs_to :users
  belongs_to :corporation
end
