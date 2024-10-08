class User < ApplicationRecord
    has_many :dependents, class_name: 'Dependent'
    has_many :favorites, class_name: 'Favorite'
    has_many :favorite_organizations, class_name: 'Organization', through: :favorites
    has_many :reviews, class_name: 'Review'
    has_many :reviewed_organizations, class_name: 'Organization', through: :reviews
    has_many :surveys, class_name: 'Survey'
    #this is an array that holds our age ranges
    AGE_RANGES = ['0-18', '19-24', '25-34', '35-70', '70-+']

    #this validation is useful bc it makes sure a user has an appropiate age range before saving the user to the db
    validates :ageRange, presence: true, inclusion: { in: AGE_RANGES }      
end
