source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11.0'
use_frameworks!

target 'FlutterWithPods' do
  flutter_application_path = './flutter_lib'
  eval(File.read(File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')), binding)
end

