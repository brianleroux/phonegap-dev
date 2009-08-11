module Iphone
  # TODO need to verify version
  def iphone_supported?
    return File.exists?("/usr/bin/xcodebuild")
  end 
  
  # options for the build
  def config
    {'Release'=>'iphoneos3.0','Debug'=>'iphonesimulator3.0'}
  end 
  
  def is
    File.join(platform_path,'iphone/www')
  end 
  
  # builds the iphone using xcode, FIXME should use open toolchain
  def build_iphone(path_to_build, debug=true)
    if iphone_supported?
      puts "Building for iPhone..."
      www_local = File.join(path_to_build,'www')
      www_build = File.join(platform_path,'iphone/www')
      FileUtils.mkdir_p(path_to_build)
      puts "Copying #{www_local} to #{www_build}..."
      File.copy(www_local, www_build)
      puts `cd #{www_build}; /usr/bin/xcodebuild -alltargets -configuration Debug -sdk #{debug ? config['Debug'] : config['Release']}`
      `iphonesim launch #{ www_build } 3.0` if debug
    else
      puts 'Skipping iPhone build: iphone sdk not installed.'
    end 
  end
  #
end 