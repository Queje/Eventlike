class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances
    belongs_to :admin, class_name: "User"


    validates :start_date, presence: true, if: :future_date
    validates :duration, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
    validates :title, presence: true
    validates :description, presence: true
    validates :price, presence: true, :inclusion => 1..1000
    validates :location, presence: true

    def future_date
        errors.add(:start_date, "Event can't be in the past") unless start_date > DateTime.now
    end

end
