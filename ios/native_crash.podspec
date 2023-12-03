#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint native_crash.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'native_crash'
  s.version          = '1.0.0'
  s.summary          = 'Flutter plugin to simulate native crash'
  s.description      = <<-DESC
Flutter plugin to simulate native crash
                       DESC
  s.homepage         = 'https://kishormainali.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Kishor Mainali' => 'work.mkishor@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'IOSSecuritySuite'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
