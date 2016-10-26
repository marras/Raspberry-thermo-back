require 'spec_helper'
require_relative '../../../../apps/web/views/data/create'

describe Web::Views::Data::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/data/create.html.erb') }
  let(:view)      { Web::Views::Data::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
