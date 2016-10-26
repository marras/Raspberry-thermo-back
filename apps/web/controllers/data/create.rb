module Web::Controllers::Data
  class Create
    include Web::Action

    accept :json

    before :require_login!

    def call(params)
      values = params[:values]
      values.each do |metric_name, value|
        metric = Metric.find_or_create(name: metric_name)

        point = Point.find(metric_id: metric.id, day: Date.today) || Point.new(metric_id: metric.id, day: Date.today)
        point.value = value.to_i
        point.metric = metric

        puts point.inspect
        point.save
      end

      self.body = '{ "status": "ok" }'
    end

    private

    def verify_csrf_token?
      false # we should probably implement some signing mechanism
    end
  end
end
