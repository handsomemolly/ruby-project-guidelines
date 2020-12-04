class Team < ActiveRecord::Base
    belongs_to :tournaments
    has_many :scorers
    has_many :leagues, through: :qualifiers
end
