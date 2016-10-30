module Web::Controllers::Data
  class Index
    include Web::Action

    before :require_login!

    expose :start_date
    expose :end_date

    def call(params)
      if params[:start] && params[:end]
        @start_date = params[:start]
        @end_date = params[:end]
      else
        @start_date = Time.parse(Date.today.to_s) - 3600*24*6
        @end_date = Time.parse(Date.today.to_s) + 3600*24
      end
    end
  end
end
