require 'spec_helper'
require_relative '../../../../apps/web/controllers/data/create'

describe Web::Controllers::Data::Create do
  let(:action) { Web::Controllers::Data::Create.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
