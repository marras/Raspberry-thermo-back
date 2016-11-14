require_relative './show'
require 'csv'

module Web::Views::Data
  class CsvShow < Show
    format :csv

    def render
      csv_file = CSV.generate do |csv|
        metrics_ids = Metric.all.map(&:id)
        csv << ["time", *Metric.all.map(&:name)]
        if header
          csv << ["calibration", *Metric.all.map { |m| "%+1.1f" % m.calibration }]
        end
        series.each do |day, values|
          arr = metrics_ids.map do |metric_id|
            value_for_metric = values.find { |v| v.metric_id == metric_id }
            value_for_metric && value_for_metric.value
          end
          csv << [day, *arr]
        end
      end

      raw csv_file
    end

    private

    def points
      Point.date_range(start_date, end_date)
    end

    def series
      Hash[points.group_by(&:day)]
    end
  end
end
