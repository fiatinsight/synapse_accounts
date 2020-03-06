require 'test_helper'

module FiatUsers
  class Concerns::Stripeable < ActiveSupport::TestCase
    test "should create Stripe customer" do
      customer = Customer.create(name: "Test customer")
      assert customer.save, "Customer didn't save"
    end
  end
end
