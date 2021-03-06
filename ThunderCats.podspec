#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "ThunderCats"
  s.version          = "1.0.13"
  s.summary          = "Useful categories"
  s.description      = <<-DESC
                       Useful categories used by Metova
                       DESC
  s.homepage         = "http://metova.com"
  s.license          = 'MIT'
  s.authors           = { "Logan Gauthier" => "logan.gauthier@metova.com", "Kurt Treangen" => "kurt.treangen@metova.com", "William Grand" => "william.grand@metova.com" }
  s.source           = { :git => "https://github.com/metova/ThunderCats.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true
  s.source_files = 'Categories/*.{h,m}'
  s.public_header_files = 'Categories/*.h'
  s.dependency 'NYXImagesKit', '~> 2.3'
  s.dependency 'SDWebImage', '~> 3.7.1'
end 
