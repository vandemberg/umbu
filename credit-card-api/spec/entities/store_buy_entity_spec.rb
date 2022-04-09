require 'rails_helper'

RSpec.describe "StoreBuyEntity" do
  it "should allow the purchase" do
    expect(StoreBuyEntity.balance_enough_to_purchase?(1000, 100)).to be(true)
  end

  it "should denied the purchase" do
    expect(StoreBuyEntity.balance_enough_to_purchase?(100, 1000)).to be(false)
  end
end
