module Web::Controllers::Data
  class Create
    include Web::Action

    accept :json

    before :validate_signature!

    def call(params)
      values = params[:values]
      timestamp = Time.now
      values.each do |sensor_id, value|
        metric = Metric.find_or_create(sensor_id: sensor_id)

        point = Point.find(metric_id: metric.id, day: timestamp) || Point.new(metric_id: metric.id, day: timestamp)
        point.value = value.to_f

        puts point.inspect
        point.save
      end

      Tunnel.first.update(address: params[:tunnel])

      self.body = '{ "status": "ok" }'
    end

    private

    def verify_csrf_token?
      false
    end
  end
end
