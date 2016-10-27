module Web::Controllers::Data
  class Create
    include Web::Action

    accept :json

    before :validate_signature!

    def call(params)
      values = params[:values]
      timestamp = Time.now
      values.each do |metric_name, value|
        metric = Metric.find_or_create(name: metric_name)

        point = Point.find(metric_id: metric.id, day: timestamp) || Point.new(metric_id: metric.id, day: timestamp)
        point.value = value.to_f

        puts point.inspect
        point.save
      end

      self.body = '{ "status": "ok" }'
    end

    private

    def verify_csrf_token?
      false
    end
  end
end
