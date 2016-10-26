module Web::Controllers::Metrics
  class Index
    include Web::Action

    expose :metrics

    before :require_login!

    def call(params)
      self.format = :json
    end
  end
end
