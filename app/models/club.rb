class Club < ActiveRecord::Base
    belongs_to :league
    has_many :players
    has_many :leagues, through :classified_club 
end
