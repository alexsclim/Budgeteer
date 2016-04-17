class Budget < ActiveRecord::Base
  belongs_to :user

  validates :allocated_food, :allocated_housing, :allocated_utilities,
            :allocated_transportation, :allocated_health, :allocated_clothing,
            :allocated_education, :allocated_fitness, :allocated_electronics,
            :allocated_other, :user_id, presence: true

end
