require 'uri'

module Web::Views::Data
  class Index
    include Web::View

    def current_temps
      Metric.all.map do |metric|
        temp = Point
          .where(metric_id: metric.id)
          .order(:day)
          .last
          .value
        [ metric.name, temp ]
      end
    end

    def tunnel_ssh
      Tunnel.first.address
    end
  end
end
