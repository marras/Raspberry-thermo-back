module Web::Views::Data
  class Index
    include Web::View

    def labels
      raw(dates.map do |d|
        d.strftime('%e %b')
      end.to_json)
    end

    def series
      raw(Metric.all.map do |metric|
        metric_points = []

        dates.each do |date|
          point = all_points.find { |p| p.metric_id == metric.id && p.day.to_date == date}
          if point
            metric_points << point.value
          else
            metric_points << nil
          end
        end

        metric_points
      end.to_json)
    end

    def metric_names
      Metric.all.map(&:name)
    end

    private

    def dates
      (start_date..end_date)
    end

    def all_points
      @all_points ||= Metric.all.map(&:points).flatten
    end

    def start_date
      all_points.map(&:day).min.to_date
    end

    def end_date
      all_points.map(&:day).max.to_date
    end
  end
end
