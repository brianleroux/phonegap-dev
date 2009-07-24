module Blackberry
  # FIXME
  def blackberry_supported?
    false
  end
  
  # FIXME
  def build_blackberry(path)
=begin
Blackberry uses something rapc.exe to do builds.
http://www.blackberry.com/developers/javaknowledge/bbJDE/kpa0203190506.shtml

From the command line something like this should work:

>> rapc.exe import=c:\foo\net_rim_api.jar codename=phonegap-bitches -midlet jad=my-app-properties-metadata.jad @file-list.txt

"@file-list.txt" is a newline separated list of .java files to include

It requires (at leaset) rapc.exe from the Blackberry JDE (which I am
not sure if we can redistribute or not) and JDK.

To sign the app from the command line you do this:

>> java -jar "SignatureTool.jar" -a -c -p <mypass> c:\phonegap-bitches.cod


There is also a handy projects that links all this to ANT tasks if we
want http://bb-ant-tools.sourceforge.net/
=end     
    FileUtils.mkdir_p(File.join(bin,'blackberry')) if blackberry_supported?
  end
end 