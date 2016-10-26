class Metric < Sequel::Model
  one_to_many :points
end
