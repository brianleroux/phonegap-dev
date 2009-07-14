module Blackberry
  # FIXME
  def blackberry_supported?
    false
  end
  
  # FIXME
  def build_blackberry(path)
    FileUtils.mkdir_p(File.join(bin,'blackberry')) if blackberry_supported?
  end
end 