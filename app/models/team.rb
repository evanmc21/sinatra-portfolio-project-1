class Team < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :name, :chaser, :beater, :seeker, :keeper
end