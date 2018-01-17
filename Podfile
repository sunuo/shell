# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
# use_frameworks!!

source 'ssh://git@gitlab.qiyi.domain:10022/mobile-ios/PodSpecs.git'

def universialPod

    pod 'QYStatistics', '8.9.0.1'

    pod 'avlib', '8.9.5.6', :configurations => ['Release']
    pod 'avlib_debug', '8.9.5.6', :configurations => ['Debug']    

    pod 'playerAds', '5.20.006'

    pod 'React', '41.8.9.5.3'

    pod 'libcmds', '8.1.2'

    pod 'BaiduSDK', '1.0.8'
    
    pod 'cube', '10.10.7.77'
    
    pod 'iAppTracker', '1.1.991'
    
    pod 'libAds', '3.13.003'
    
    pod 'QYCast', '8.9.10.34', :configurations => ['Release']
    pod 'QYCast_debug', '8.9.10.34', :configurations => ['Debug']

    pod 'baseqylib', '8.9.5.3', :configurations => ['Release']
    pod 'baseqylib_debug', '8.9.5.3', :configurations => ['Debug']

    pod 'baseqylibnet', '8.9.5.3', :configurations => ['Release']
    pod 'baseqylibnet_debug', '8.9.5.3', :configurations => ['Debug']
    
    pod 'qylibthin', '8.9.5.5', :configurations => ['Release']
    pod 'qylibthin_debug', '8.9.5.5', :configurations => ['Debug']
    
    pod 'QYBarrage', '8.9.5.0'
    
    pod 'libiqiyidlna', '8.6.0'
    
    pod 'QYEngine', '8.7.0.2'
    
    pod 'puma3', '3.14.5.3826'
    
    pod 'QYMQTTPushLib', '1.1.9'
    
    pod 'QYOfflineBaseManager', '8.9.5.6'
    
    pod 'QYShare', '8.9.5.1'
    
    pod 'QYWebview', '8.9.0.4'
    
    pod 'WXSDKExport', '1.0.0'
    
    pod 'QYBaseUIKit', '8.9.5.2'
    
    pod 'QVPingback' , '8.0.1' 
    
    pod 'xcrash', '1.0.9.0'
    
    pod 'QYApm', '1.3.8'
    
    pod 'QYIMFramework', '8.6.4'

    pod 'QYPlayer', '8.9.5.6'
    
    pod 'qyfacebook','7.11.3'
    
    pod 'QYBaseLineASI', '1.0.6'
    
    pod 'SDWebImageWebP', '8.9.0.6'

    pod 'QYBaseLineFMDB', '1.0.1'

    pod 'QYBaseLineOpenssl', '1.0.2'

    pod 'QYBaseLineLottie', '1.5.1.2'
    
    pod 'QYPassport','8.9.5.1'
    
    pod 'Masonry','8.1.1'
      
    pod 'QYPayAPI','8.9.0.2'

    pod 'AppsFlyerFramework','4.7.3.1'
end

def iPhonePod
    pod 'QYGameCenter', '8.9.41'
    
    pod 'PaoPaoProject', '8.9.5.0'
    
    pod 'QYComic', '8.9.5.2'
 
    pod 'libQiXiu', '4.8.5'

    pod 'QYMovieTicket', '6.6.0.12'
    
    pod 'libQYChatRoom', '8.9.03'
    
    pod 'QYOfflinePhoneManager', '8.9.5.5'
    
    pod 'QYPay', '8.9.0.9'

    pod 'QYWallet', '8.9.0.1'

    pod 'QYMall', '8.8.5.0'
    
    pod 'QYReader', '8.9.5'

    pod 'libPlayerPhone', '8.9.5.6'

    pod 'UGCUpload','8.9.0.2'
    
    pod 'PPQCameraSDK','8.9.0.5'
    
    pod 'UGCLive','8.9.0.2'
    
    pod 'libGPUFilter', '1.1.4.8'
    
    pod 'libGPUImage', '1.1.7.21'
    
    pod 'AlipaySDK','1.0.1'
    
    pod 'QYGamelive','8.8.5.9'

    pod 'libUPAPayPlugin','1.0.1'
    
    pod 'libQYProps', '8.8.5.6'
end

def iPadPod
    pod 'QYOfflinePadManager', '8.9.5.4'
   
    pod 'QYHelp', '8.8.0.1'

    pod 'QYIpadPaopao', '8.9.0'
end

target 'QiYiVideo' do
    universialPod

    iPhonePod

    pod 'PaoPaoCardiPhone', :git => 'ssh://scm.qiyi.domain:29418/paopao_ios/paopao_card', :tag => '20170913.1', :inhibit_warnings => true
    
    pod 'QYLoginPhone', '8.9.5.1'
    
    pod 'libSearchPhone', '8.9.0.4'
    
    pod 'QYUIKitCommon', '8.9.5.5'
    
    pod 'QYUIKitComic', '8.8.5.2'
end

target 'QiYiPadVideo' do
    universialPod

    iPadPod

    pod 'QYLoginPad', '8.9.5.1'

    pod 'QYPay_iPad', '8.9.0.9'
        
    pod 'libSearchPad', '8.9.0.4'
    
    pod 'QYUIKitCommonPad', '8.9.5.5'
    
    pod 'QYUIKitComicPad', '8.8.5.2'
    
    pod 'libPlayerPad', '8.9.5.6'
    
    pod 'PaoPaoCardiPad', :git => 'ssh://scm.qiyi.domain:29418/paopao_ios/paopao_card', :tag => '20170913.1', :inhibit_warnings => true
    
    
end

target 'QiYiVideo_Uni' do
    universialPod

    iPhonePod
    
    iPadPod

    pod 'QYLoginUni', '8.9.5.1'
  
    pod 'libSearchPPS', '8.9.0.4'
    
    pod 'QYUIKitCommonUni', '8.9.5.5'
    
    pod 'QYUIKitComicUni', '8.8.5.2'
    
    pod 'PaoPaoCard', :git => 'ssh://scm.qiyi.domain:29418/paopao_ios/paopao_card', :tag => '20170913.1', :inhibit_warnings => true
        
end


post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
    end
end

ENV["COCOAPODS_DISABLE_STATS"] = "true"
xcodeproj 'QiYiVideo.xcodeproj'
