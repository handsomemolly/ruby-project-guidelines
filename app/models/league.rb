class League < ActiveRecord::Base
    has_many :clubs, through: :classified_status
end