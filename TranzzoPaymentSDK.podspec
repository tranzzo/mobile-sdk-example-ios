Pod::Spec.new do |spec|

  spec.name          = 'TranzzoPaymentSDK'
  spec.version       = '1.4.16'
  spec.summary       = 'TranzzoPaymentSDK'
  spec.description   = 'Framework for Payments'
  spec.homepage      = 'https://tranzzo.ua'
  spec.license       = 'MIT'
  spec.license       = { :type => 'MIT', :file => 'LICENSE.md' }
  spec.author        = { 'Vitalii Stepanov' => 'v.stepanov@tranzzo.com' }
  spec.platform      = :ios, "11.0"
  spec.swift_version = '5.0'
  spec.vendored_frameworks = 'Sources/TranzzoPaymentSDK.framework'
  spec.source        = { :git => 'https://github.com/tranzzo/mobile-sdk-example-ios.git', :tag => "#{spec.version}" }
  spec.dependency 'PayCardsRecognizer', '1.1.6'
  spec.dependency 'OwlKit'
  spec.dependency 'AnyFormatKit'
end
