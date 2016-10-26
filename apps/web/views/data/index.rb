module Web::Views::Data
  class Index
    include Web::View

    def labels
      #raw(dates.map do |d|
        #d.strftime('%e %b')
      #end.to_json)
    end

    def series
      raw(Metric.all.map do |metric|
        Point.where(metric_id: metric.id)
          .order(:day)
          .where(day: (start_date.to_i..end_date.to_i))
      end.to_json)
    end

    def metric_names
      Metric.all.map(&:name)
    end

    private

    def dates
      (start_date..end_date)
    end
  end
end
