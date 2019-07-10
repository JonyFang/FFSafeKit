#
#  Be sure to run `pod spec lint FFSafeKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name                = "FFSafeKit"
  s.version             = "0.1.1"
  s.summary             = "Using NSArray, NSMutableArray, NSDictionary, NSMutableDictionary, NSMutableString safely."

  s.description         = <<-DESC
                          Now using NSArray, NSMutableArray, NSDictionary, NSMutableDictionary, NSMutableString as usual, and will never throw exception.
                          DESC

  s.homepage            = "https://github.com/JonyFang/FFSafeKit"
  s.license             = { :type => "MIT", :file => "LICENSE" }
  s.author              = { "JonyFang" => "jony.chunfang@gmail.com" }
  s.social_media_url    = "https://www.jonyfang.com"

  s.requires_arc        = true
  s.framework           = "Foundation"
  s.ios.deployment_target = "8.0"

  s.source_files        = "FFSafeKit/**/*.{h,m}"
  s.public_header_files = "FFSafeKit/*.{h}"
  s.source              = { :git => "https://github.com/JonyFang/FFSafeKit.git", :tag => s.version.to_s }

end
