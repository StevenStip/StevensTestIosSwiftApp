source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/deltaDNA/CocoaPods.git'

# Uncomment this line to define a global platform for your project
 platform :ios, '8.0'
# Uncomment this line if you're using Swift
 use_frameworks!

target 'testAppSDKIntegration' do
 pod 'DeltaDNA', '~> 4.0'
end

# Enable extra logging
post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'DeltaDNA' || target.name == 'DeltaDNAAds'
            target.build_configurations.each do |config|
                config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)']
                config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] << 'DDNA_DEBUG=1'
            end
        end
    end
end
