class ClassifiedStatus < ActiveRecord::Base
    has_many :clubs
    has_many :leagues 
end