# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{url_store}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Grosser"]
  s.date = %q{2010-01-20}
  s.description = %q{Data securely stored in urls.}
  s.email = %q{grosser.michael@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/url_store.rb",
     "lib/url_store/compact_encoder.rb",
     "spec/spec_helper.rb",
     "spec/url_store/compact_encoder_spec.rb",
     "spec/url_store_spec.rb",
     "url_store.gemspec"
  ]
  s.homepage = %q{http://github.com/grosser/url_store}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Data securely stored in urls.}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/url_store_spec.rb",
     "spec/url_store/compact_encoder_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

