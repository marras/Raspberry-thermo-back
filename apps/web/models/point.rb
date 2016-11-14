class Point < Sequel::Model
  many_to_one :metric

  def self.last_calibrated(metric)
    calibration = metric.calibration

    value = self
      .where(metric_id: metric.id)
      .order(:day)
      .last
      .value

    value + calibration
  end
end
