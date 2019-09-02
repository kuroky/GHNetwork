#
#  Be sure to run `pod spec lint GHNetwork.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "GHNetwork"
  spec.version      = "1.0.1"
  spec.summary      = "基于AFNetworking和YTKNetwork的网络组件"

  spec.description  = <<-DESC
    基于AFNetworking和YTKNetwork网络组件
                   DESC

  spec.homepage     = "https://github.com/kuroky"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "kuroky" => "kuro2007cumt@gmail.com" }

  spec.platform     = :ios, "10.0"

  spec.source       = { :git => "https://github.com/kuroky/GHNetwork.git", :tag => spec.version }

  spec.subspec "YTKNetwork" do |ss|
    ss.source_files = "Classes/YTKNetwork/*.{h,m}"
  end
  
  spec.subspec "Network" do |ss|
    ss.source_files = "Classes/Network/*.{h,m}"
    ss.dependency "GHNetwork/YTKNetwork"
    # dependency's requirements can't be a git, https://github.com/CocoaPods/CocoaPods/issues/8550
  end
  
  spec.dependency "AFNetworking", "3.2.1"

end
