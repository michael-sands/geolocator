require 'features_helper'

describe 'basic' do
  it 'works' do
    visit '/'
    page.body.must_include('country:')
  end
end
