require 'spec_helper'
require_relative '../../../apps/web/controllers/home/index'

describe Web::Controllers::Home::Index do
  let(:action) { Web::Controllers::Home::Index.new }

  it "is successful for US" do
    response = action.call("REMOTE_ADDR" => "74.125.225.224")
    response[0].must_equal 200
    response[2].first.must_match /country: US/
  end
  
  it "is successful for NZ" do
    response = action.call("REMOTE_ADDR" => "14.1.32.0")
    response[0].must_equal 200
    response[2].first.must_match /country: NZ/
  end

  it "is successful for Australia" do
    response = action.call("REMOTE_ADDR" => "14.102.136.0")
    response[0].must_equal 200
    response[2].first.must_match /country: AU/
  end
  
  it "is successful for Canada" do
    response = action.call("REMOTE_ADDR" => "17.44.224.0")
    response[0].must_equal 200
    response[2].first.must_match /country: CA/
  end
  
  it "doesn't find localhost" do
    response = action.call("REMOTE_ADDR" => "127.0.0.1")
    response[0].must_equal 404
    response[2].first.must_match /country: NOT_FOUND/
  end
end
