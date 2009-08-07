%w(devices/android devices/iphone devices/blackberry net/http uri zip/zip).each { |x| require x  }
#
# Provides utilities for generating a PhoneGap application and unifies the build process for each of the supported mobile platforms.
#
class PhoneGap
  
  include Iphone
  include Android
  include Blackberry
  
  # outputs the current version of PhoneGap 
  # FIXME needs to pull from sauce repo found at install path
  def version
    '0.7.4'
  end 
  
  # grab install path of the phonegap sauce 
  def install_path
    File.expand_path('~/.phonegap')
  end 
  
  # check for the phonegap sauce
  def has_phonegap_sauce?
    File.exists?(install_path)
  end
  
  # downloads the latest version and puts it in install_path/version
  def install_phonegap_sauce
    url = URI.parse("http://github.com/sintaxi/phonegap/zipball/#{ version }/")
    found = false 
    until found 
      host, port = url.host, url.port if url.host && url.port 
      req = Net::HTTP::Get.new(url.path) 
      res = Net::HTTP.start(host, port) {|http| http.request(req) } 
      res.header['location'] ? url = URI.parse(res.header['location']) : 
      found = true 
    end
    FileUtils.mkdir_p(install_path)
    zip_path = File.join(install_path, 'phonegap.zip')
    final_path = File.join(install_path, version.gsub('.','-'))
    open(zip_path, 'w+') {|f| f.write(res.body) }
    unzip(zip_path, final_path)
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
  
  def unzip(file, destination)
    Zip::ZipFile.open(file) do |zip_file|
      zip_file.each do |f|
        #f_path=File.join(destination, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      end
    end
  end
end 