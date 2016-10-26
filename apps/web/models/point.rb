class Point < Sequel::Model
  many_to_one :metric
end
