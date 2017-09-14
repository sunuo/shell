#
#  Be sure to run `pod spec lint QYCast.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "QYCast"
  s.version      = ""

  s.summary      = "QYCast"

  s.description  = <<-DESC
                    QYCast description.
                   DESC
  s.homepage     = "https://scm.qiyi.domain:29418/mobile-ios/pods//QYCast"
  s.license      = { :type => 'MIT', :text => <<-LICENSE
                    LICENSE
                   }

  s.author       = { "Edward Chen" => "chenqinghua@qiyi.com" }

  s.platform     = :ios
  s.ios.deployment_target = '7.0'

  s.source       = { :git => "ssh://scm.qiyi.domain:29418/mobile-ios/pods/QYCast.git", :tag => s.version }

  s.source_files = '*.h',"include/*.h"
  s.public_header_files = '*.h',"include/*.h"

  s.framework = 'SystemConfiguration'
  s.preserve_paths = 'Release'
  s.ios.vendored_libraries =  "Release/libQYCast.a" 

  s.requires_arc = false
end
