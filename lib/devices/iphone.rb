module Iphone
  # TODO need to verify version is 3.0
  def iphone_supported?
    return File.exists?("/usr/bin/xcodebuild")
  end 
  
  # builds the iphone using xcode, FIXME should use open toolchain
  def build_iphone(path_to_build, debug=true)
    if iphone_supported?
      conf = {'Release'=>'iphoneos3.0','Debug'=>'iphonesimulator3.0'}
      FileUtils.mkdir_p(path_to_build) 
      www_local = File.join(path_to_build,'www')
      www_build = File.join(full_install_path,'iphone')
      puts "Building for iPhone...\n"
      puts "Copying #{www_local} to #{www_build}...#{`cp -r #{www_local} #{www_build}`}\n"
      puts `cd #{www_build}; /usr/bin/xcodebuild -alltargets -configuration Debug -sdk #{debug ? conf['Debug'] : conf['Release']}`
      if debug
        `iphonesim launch #{ www_build } 3.0`
      end
    else
      puts 'skipping iphone build: iphone sdk not installed or phonegap source not in ~/.phonegap'
    end 
  end
end 