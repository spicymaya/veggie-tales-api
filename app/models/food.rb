class Food < ApplicationRecord
    self.inheritance_column = :_type_disabled
    # validations
    validates_presence_of :name, :region, :type, :rating, :image_url
    validates :type, inclusion: { in: ["fruit", "vegetable", "berry"] }
end
