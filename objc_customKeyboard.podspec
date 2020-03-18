

Pod::Spec.new do |s|
  s.name         = 'objc_customKeyboard'
  s.license      = 'MIT'
  s.requires_arc = true
  s.version      = '0.0.2'
  s.platform 	= :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.framework 	= 'UIKit'
  s.summary      = 'A customKeyboard for iOS'
  s.author             = { "zhouchangmi" => "zhouchangmi@gmail.com" }
  s.source_files  = 'objc_customKeyboard", "objc_customKeyboard/**/*.{h,m}'
  s.homepage     = 'https://github.com/shumozhou/objc_customKeyboard'
  s.source       = { :git => 'https://github.com/shumozhou/objc_customKeyboard.git', :tag => s.version }
  
end
