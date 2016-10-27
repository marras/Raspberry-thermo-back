require_relative './show'
require 'csv'

module Web::Views::Data
  class CsvShow < Show
    format :csv

    def render
      csv_file = CSV.generate do |csv|
        metrics_ids = Metric.all.map(&:id)
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
      Point
        .order(:day)
        .where('day > ?', start_date)
        .where('day < ?', end_date)
    end

    def series
      Hash[points.all.group_by(&:day)]
    end
  end
end
