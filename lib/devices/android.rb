module Android
  # FIXME
  def android_supported?
    false
  end 
  
  # FIXME
  def build_android(path)
    FileUtils.mkdir_p(File.join(bin,'android')) if android_supported?
  end
end 