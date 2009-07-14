# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{phonegap}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian LeRoux"]
  s.date = %q{2009-07-14}
  s.email = %q{brian@westcoastlogic.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "lib/devices/android.rb",
     "lib/devices/blackberry.rb",
     "lib/devices/iphone.rb",
     "lib/generate/config/android-dev-cert.txt",
     "lib/generate/config/blackberry-dev-cert.txt",
     "lib/generate/config/bootstrap.js",
     "lib/generate/config/iphone-dev-cert.txt",
     "lib/generate/www/assets/css/master.css",
     "lib/generate/www/assets/js/phongap.js",
     "lib/generate/www/index.html",
     "lib/phonegap-console.rb",
     "lib/phonegap.rb",
     "test/phonegap-dev_test.rb",
     "test/test_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/brianleroux/phonegap-dev}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{phonegap}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "test/phonegap-dev_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
