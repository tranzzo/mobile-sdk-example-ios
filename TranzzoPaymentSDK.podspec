Pod::Spec.new do |spec|

  spec.name          = 'TranzzoPaymentSDK'
  spec.version       = '1.5.19'
  spec.summary       = 'TranzzoPaymentSDK'
  spec.description   = 'Framework for Payments'
  spec.homepage      = 'https://tranzzo.ua'
  spec.license       = 'MIT'
  spec.license       = { :type => 'MIT', :file => 'LICENSE.md' }
  spec.author        = { 'Vitalii Stepanov' => 'v.stepanov@tranzzo.com' }
  spec.platform      = :ios, "13.0"
  spec.swift_version = '5.0'
  spec.vendored_frameworks = 'Sources/TranzzoPaymentSDK.xcframework'
  spec.source        = { :git => 'https://github.com/tranzzo/mobile-sdk-example-ios.git', :tag => "#{spec.version}" }
end
