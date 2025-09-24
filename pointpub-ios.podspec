Pod::Spec.new do |s|
  s.name = "pointpub-ios"
  s.version = "1.0.2"
  s.summary = "PointPub SDK for iOS"
  s.description = "PointPub SDK for iOS"
  s.homepage = "https://neptunecompany.kr/"
  s.license = { "type"=>"MIT" }
  s.author = "Neptune Company"
  s.source = { :http => "https://github.com/adxcorp/pointpub-ios-release/archive/refs/tags/#{s.version}.tar.gz" }
  s.ios.deployment_target = '13.0'
  s.ios.vendored_framework = 'PointPub/PointPubSDK.xcframework'
end
