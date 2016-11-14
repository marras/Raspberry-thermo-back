class Point < Sequel::Model
  many_to_one :metric

  def self.last_calibrated(metric)
    where(metric_id: metric.id)
      .order(:day)
      .last
      .calibrated_value
  end

  def self.date_range(start_date, end_date)
    self
      .order(:day)
      .where('day > ?', start_date)
      .where('day < ?', end_date)
      .map do |point|
        point.tap { |p| p.value = p.calibrated_value }
      end
  end

  def calibrated_value
    value + metric.calibration
  end
end
