class League < ActiveRecord::Base
    has_many :clubs, through :classified_club
    has_many :clubs
end