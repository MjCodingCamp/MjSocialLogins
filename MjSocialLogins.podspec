Pod::Spec.new do |s|
  s.name             = 'MjSocialLogins'
  s.version          = '0.1.2'
  s.swift_version    = '5.0'
  s.summary          = 'A simple & light weight open source library for all standard social logins.'

# This description is used to generate tags and improve search results.

  s.description      = <<-DESC
  'A simple & light weight open source library for all standard social login like: apple, google, facebook, Which provides the support for UIKit & SwiftUI frameworks.'
                       DESC

  s.homepage         = 'https://github.com/MjCodingCamp/MjSocialLogins.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mohammad Jeeshan' => 'mohammad.jeeshan.91@gmail.com' }
  s.source           = { :git => 'https://github.com/MjCodingCamp/MjSocialLogins.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MjCodingCamp'

  s.ios.deployment_target = '13.0'
  
  s.source_files = 'MjSocialLogins/Classes/*'
  
  # s.resource_bundles = {
  #   'MjSocialLogins' => ['MjSocialLogins/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'GoogleSignIn'
  s.dependency 'FBSDKLoginKit/Swift'
end
