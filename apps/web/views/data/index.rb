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

    def last_measured
      time = Point.order(:day).last.day
      diff_min = (Time.now - time) / 60
      if diff_min < 1
        "Just now"
      elsif diff_min < 60
        "#{diff_min.round(1)} minutes ago"
      else
        "#{(diff_min / 60).round(1)} hours ago"
      end
    end
  end
end
