class Food < ApplicationRecord
    self.inheritance_column = :_type_disabled
    # validations
    validates_presence_of :name, :region, :type
    validates :type, inclusion: { in: ["fruit", "vegetable"] }
    validates :name, uniqueness: true, on: :create
end
