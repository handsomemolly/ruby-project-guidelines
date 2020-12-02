class Country < ActiveRecord::Base
    has_many :leagues
    has_one :national_team
end
