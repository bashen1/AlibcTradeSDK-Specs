#
# Be sure to run `pod lib lint AlibcTradeSDK-Specs.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AlibcTradeSDK-Specs'
  s.version          = '0.1.0'
  s.summary          = '阿里百川 AlibcTradeSDK'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/bashen1/AlibcTradeSDK-Specs'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '孑愁' => 'maochunjie@gmail.com' }
  s.source           = { :git => 'https://github.com/bashen1/AlibcTradeSDK-Specs.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  # s.source_files = 'AlibcTradeSDK-Specs/Classes/**/*'

  s.resources = "mtopsdk_configuration.plist"
  
  s.subspec 'AliAuthSDK' do |ss|
    ss.platform = '8.0'
    ss.requires_arc = true
    ss.resources = ["AliAuthSDK/AlibabaAuthSDK.framework/AlibabaAuthSDK.bundle"]
    ss.vendored_frameworks = "AliAuthSDK/AlibabaAuthEntrance.framework", "AliAuthSDK/AlibabaAuthExt.framework", "AliAuthSDK/AlibabaAuthSDK.framework"
  end

  s.subspec 'AlibcTradeSDK' do |ss|
    ss.platform = '8.0'
    ss.source_files = "AlibcTradeSDK/AlibcTradeSDK.framework/Headers/*", "AlibcTradeSDK/AlibcTradeBiz.framework/Headers/*"
    ss.vendored_frameworks = "AlibcTradeSDK/AlibcTradeSDK.framework", "AlibcTradeSDK/AlibcTradeBiz.framework"
    ss.resources = ["AlibcTradeSDK/AlibcTradeBiz.framework/NBResource.bundle"]
  end

  s.subspec 'mtopSDK' do |ss|
    ss.platform = '8.0'
    ss.vendored_frameworks = "mtopSDK/MtopSDK.framework", "mtopSDK/mtopext.framework", "mtopSDK/mtopcoreopen.framework"
    ss.frameworks = "UIKit", "Foundation"
  end

  s.subspec 'securityGuard' do |ss|
    ss.platform = '7.0'
    ss.source_files = "securityGuard/SGMain.framework/Headers/*", "securityGuard/SGSecurityBody.framework/Headers/*", "securityGuard/SGMiddleTier.framework/Headers/*", "securityGuard/SGIndieKit.framework/Headers/*", "securityGuard/SGNoCaptcha.framework/Headers/*", "securityGuard/SecurityGuardSDK.framework/Headers/*"
    ss.vendored_frameworks = "securityGuard/SecurityGuardSDK.framework", "securityGuard/SGSecurityBody.framework", "securityGuard/SGMiddleTier.framework", "securityGuard/SGMain.framework", "securityGuard/SGIndieKit.framework", "securityGuard/SGNoCaptcha.framework"
    ss.weak_frameworks = "AdSupport"
    ss.frameworks = "CoreGraphics", "Foundation", "UIKit", "CFNetwork", "CoreFoundation", "SystemConfiguration", "CoreTelephony", "CoreLocation", "CoreMotion", "Security"
    ss.libraries = "z"
    ss.exclude_files = "securityGuard/SGMain.framework/Info.plist", "securityGuard/SGSecurityBody.framework/Info.plist", "securityGuard/SGMiddleTier.framework/Info.plist", "securityGuard/SGIndieKit.framework/Info.plist", "securityGuard/SecurityGuardSDK.framework/Info.plist", "securityGuard/SGNoCaptcha.framework/Info.plist"
  end

  s.subspec 'WindVane' do |ss|
    ss.subspec 'WindVane' do |sss|
      sss.platform = '8.0'
      sss.source_files = 'WindVane/WindVane.framework/Headers/*'
      sss.vendored_frameworks = 'WindVane/WindVane.framework'
    end
    ss.subspec 'Basic' do |sss|
      sss.platform = '8.0'
      sss.source_files = 'WindVane/WindVaneBasic.framework/Headers/*'
      sss.vendored_frameworks = 'WindVane/WindVaneBasic.framework'
      sss.resources = ["WindVane/WindVaneBasic.framework/Resources/WindVaneBasic.bundle", "WindVane/WindVaneBasic.framework/Resources/NebulaWK.bundle"]
      sss.weak_frameworks = "WebKit"
    end
    ss.subspec 'Core' do |sss|
      sss.platform = '8.0'
      sss.source_files = 'WindVane/WindVaneCore.framework/Headers/*'
      sss.vendored_frameworks = 'WindVane/WindVaneCore.framework'
      sss.resources = ["WindVane/WindVaneCore.framework/WindVaneBasic.bundle", "WindVane/WindVaneCore.framework/NebulaWK.bundle"]
      sss.weak_frameworks = "WebKit"
      sss.frameworks = "CoreGraphics", "CoreTelephony", "SystemConfiguration"
    end
  end

  s.exclude_files = "UTDID.framework/Versions/A/Resources/Info.plist"
  s.resources = ["AlibcLinkPartnerSDK.framework/SmartLink.bundle", "UTDID.framework/Versions/A/Resources/*"]
  s.preserve_paths = "UTDID.framework/*"
  s.source_files = "AlibcLinkPartnerSDK.framework/Headers/*", "UTMini.framework/Headers/*"
  s.vendored_frameworks = "AlibcLinkPartnerSDK.framework", "UTDID.framework", "UTMini.framework"
  s.frameworks = "CoreTelephony", "CoreMotion"
  s.libraries = "sqlite3", "c++", "z"
  s.requires_arc = true
  s.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/UTDID" }
end
