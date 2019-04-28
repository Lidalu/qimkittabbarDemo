# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'git@github.com:CocoaPods/Specs.git'
source 'https://github.com/qunarcorp/libqimkit-ios-cook.git'

target 'CYLTabBarController' do
  # Comment the next line if you don't want to use dynamic frameworks
#   use_frameworks!

#pod 'CYLTabBarController', '~> 1.24.1'        # 默认不依赖Lottie
#  pod 'CYLTabBarController', '~> 1.20.0'

  pod 'QIMUIKit', '~> 2.0'
  project 'CYLTabBarController.project'

  pod 'yoga', :path => './node_modules/react-native/ReactCommon/yoga'
  pod 'Folly', :podspec => './node_modules/react-native/third-party-podspecs/Folly.podspec'

  pod 'React',
  :path => './node_modules/react-native',
  :subspecs => [
  'Core',
  'RCTImage',
  'RCTNetwork',
  'RCTText',
  'RCTWebSocket',
  'RCTLinkingIOS',
  'RCTSettings',
  'RCTVibration',
  'RCTAnimation',
  'ART',
  'RCTGeolocation',
  'RCTActionSheet',
  'DevSupport',
  'CxxBridge',
  ]
  pod 'react-native-image-picker', :path => './node_modules/react-native-image-picker'
  pod 'RNSVG', :path => './node_modules/react-native-svg'
  pod 'RNVectorIcons', :path => './node_modules/react-native-vector-icons'

end

post_install do |installer_representation|

  installer_representation.pods_project.targets.each do |target|

    # 修复Pod resources中携带xcassets的情况。
    # https://github.com/CocoaPods/CocoaPods/issues/7003
    # https://github.com/CocoaPods/CocoaPods/pull/7020

    target.build_configurations.each do |config|
      config.build_settings['APPLICATION_EXTENSION_API_ONLY'] = 'NO'
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = '$(inherited) COCOAPODS=1 QIMWebRTCEnable=1 QIMNoteEnable=1 QIMAudioEnable=1 QIMZipEnable=1 QIMPinYinEnable=1, QIMRNEnable=1'
    end
  end
end
