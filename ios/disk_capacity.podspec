#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint disk_capacity.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'disk_capacity'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin for getting disk information.'
  s.description      = <<-DESC
A Flutter plugin for getting disk information.
Especially useful for iOS to get the free and total space on the device.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Koschig Raphaël' => 'raphael.koschig@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
