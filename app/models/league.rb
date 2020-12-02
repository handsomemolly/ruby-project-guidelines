class League < ActiveRecord::Base
    has_many :players
    belongs_to :country
end