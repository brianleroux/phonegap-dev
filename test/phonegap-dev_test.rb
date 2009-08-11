require 'test_helper'

class PhonegapDevTest < Test::Unit::TestCase
  context "A PhoneGap instance" do
    setup do
      @p = PhoneGap.new
    end 
  
    should "be an expected version" do
      assert_equal @p.version, '0.7.4'
    end
    
    should "generate a phonegap project"
    should "build a phonegap project for the iphone"
  end 
  # 
end
