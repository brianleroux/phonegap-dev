module Iphone
  # TODO need to verify version is 3.0
  def iphone_supported?
    return File.exists?("/usr/bin/xcodebuild")
  end 
  
  # builds the iphone using xcode, FIXME should use open toolchain
  def build_iphone(path_to_build)
    if iphone_supported? && has_phonegap_sauce?
      FileUtils.mkdir_p(path_to_build) 
      www_local = File.join(path_to_build,'www')
      www_build = File.join(install_path,'iphone')
      puts '\building for iphone...\n'
      puts "copying #{www_local} to #{www_build}...#{`cp -r #{www_local} #{www_build}`}\n"
      # Debug, Release
      conf = {'Release'=>'iphoneos3.0','Debug'=>'iphonesimulator3.0'}
      puts `cd #{www_build}; /usr/bin/xcodebuild -alltargets -configuration Debug -sdk #{conf['Debug']}`
    else
      puts 'skipping iphone build: iphone sdk not installed or phonegap source not in ~/.phonegap'
    end 
  end
end 