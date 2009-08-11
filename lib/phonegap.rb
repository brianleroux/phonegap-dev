%w(devices/android devices/iphone devices/blackberry net/http uri zip/zip).each { |x| require x  }
#
# Provides utilities for generating a PhoneGap application and unifies the build process for each of the supported mobile platforms.
#
class PhoneGap
  
  include Iphone
  include Android
  include Blackberry
  
  # outputs the current version of PhoneGap 
  def version
    '0.7.4' # FIXME needs to know which version is being submoduled in
  end 
  
  # path to the actual PhoneGap platforms source
  def platform_path
    File.join(File.dirname(__FILE__),'platforms/')
  end 
  
  # creates an app skeleton
  def generate(path)
    generate_path = File.join(Dir.pwd,path)
    template_path = File.join(File.dirname(__FILE__),'generate')
    FileUtils.cp_r(template_path, generate_path)  
    e=<<-E
    
    Generated a fresh PhoneGap application! 
    
    #{ path }/
    |
    |- config/
    |  |- bootstrap.js
    |  |- iphone-dev-cert.txt
    |  |- android-dev-cert.txt
    |  '- blackberry-dev-cert.txt
    |
    '- www/
       |- assets/
       |  |- css/
       |  |- js/
       |  '- images/
       |
       '- index.html
       
    For more information, tutorials, documentation and quickstarts visit http://phonegap.com
    
    E
    trim(e)
  end
  
  # builds a phonegap web application to all supported platforms
  def build(path)
    build_iphone(path)
    build_android(path)
    build_blackberry(path)
  end 
  
  # outputs a tidy report of which PhoneGap supported SDK's are installed
  def report
    report =<<-E
    
    PhoneGap 0.7.0
    -------------------
    
    Supported Platforms
    -------------------
    iPhone ............ #{ iphone_supported? ? 'yes' : 'no!' } .... #{ iphone_supported? ? '3.0' : 'Download and install from http://developer.apple.com' }
    Android  .......... #{ android_supported? ? 'yes' : 'no!' } .... #{ android_supported? ? '???' : 'Download and install from http://code.google.com/p/android' }
    BlackBerry ........ #{ blackberry_supported? ? 'yes' : 'no!' } .... #{ blackberry_supported? ? '???' : 'Download and install from http://developer.rim.com' }
    
    E
    trim(report)
  end  
  
  # helper for removing code indentation whitespace
  def trim(str)
    str.gsub('    ','')
  end 
  #
end 