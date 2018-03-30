#
#  Be sure to run `pod spec lint YYFLazyTableViewModel.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "YYFLazyTableViewModel"
  s.version      = "0.0.1"
  s.summary      = "A short description of YYFLazyTableViewModel."
  s.description  = <<-DESC
  A short description of LazyTableViewModel. YYFLazyTableViewModel.
                   DESC
  s.homepage     = "https://github.com/y765936789"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "yyf" => "765936789@qq.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/y765936789/YYFLazyTableViewModel.git", :tag => "#{s.version}" }
  s.source_files  = "LazyTableViewModel/*.{h,m}"
  s.requires_arc = true

end
