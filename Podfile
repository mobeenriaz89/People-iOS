# Uncomment the next line to define a global platform for your project
platform :ios, '13.1'

target 'People' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for People
  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'
  pod 'IQKeyboardManagerSwift', '6.5.0'
  post_install do |installer|
    installer.generated_projects.each do |project|
      project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
          config.build_settings['CLANG_WARN_STRICT_PROTOTYPES'] = 'NO'
        end
      end
      end
      
    end
    
  end

