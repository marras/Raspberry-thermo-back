require 'uri'

module Web::Views::Data
  class Index
    include Web::View

    def calibrations
      Metric.all.map(&:calibration)
    end

    def current_temps
      Metric.all.map do |metric|
        temp = Point.last_calibrated(metric)
        [ metric.name, temp ]
      end
    end

    def tunnel_ssh
      string = Tunnel.first.address.to_s.gsub(/\Atcp:\/\//, '')
      address, port = string.split(':')
      if port
        "ssh -p #{port} -l pi #{address}"
      else
        string
      end
    end
  end
end
