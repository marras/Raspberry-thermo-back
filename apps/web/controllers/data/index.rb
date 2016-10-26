module Web::Controllers::Data
  class Index
    include Web::Action

    before :require_login!

    def call(params)
    end
  end
end
