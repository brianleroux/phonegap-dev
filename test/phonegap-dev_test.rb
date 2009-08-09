require 'test_helper'

class PhonegapDevTest < Test::Unit::TestCase
  context "A PhoneGap instance" do
    setup do
      @p = PhoneGap.new
    end 
  
    should "be an expected version" do
      assert_equal @p.version, '0.7.4'
    end
  
    should "install phonegap sauce" do
      @p.install_phonegap_sauce
      assert_equal true, File.exists?(File.expand_path('~/.phonegap'))
    end
    
    should "generate a phonegap project"
    should "build a phonegap project for the iphone"
  end 
  # 
end
