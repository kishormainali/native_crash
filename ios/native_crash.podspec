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
  s.source_files = 'native_crash/Sources/native_crash/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '15.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'native_crash_privacy' => ['native_crash/Sources/native_crash/PrivacyInfo.xcprivacy']}
end
