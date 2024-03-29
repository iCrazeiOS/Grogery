#import "Tweak.h"

%group GroupNoAds
%hook YTAdsPlayerModule
-(void)configureWithBinder:(id)arg1 {}
%end

%hook YTAdsInnerTubeContextDecorator
-(void)decorateContext:(id)arg1 {}
%end
%end



%group GroupBGPlayback
%hook YTIPlayabilityStatus
-(BOOL)isPlayableInBackground {
	return YES;
}
%end
%end



%group GroupHideWatermark
%hook YTMainAppVideoPlayerOverlayViewController
-(void)setFeaturedChannelWatermarkImageView:(id)arg1 {} 
%end
%end



%group GroupNoDLButton
%hook YTTransferButton
-(void)setVisible:(BOOL)arg1 dimmed:(BOOL)arg2 {
	%orig(NO, arg2);
}
%end
%end



%group GroupHideCastButton
%hook YTSettings
-(BOOL)disableMDXDeviceDiscovery {
	return YES;
} 
%end

%hook YTRightNavigationButtons
-(void)layoutSubviews {
	%orig;
	self.MDXButton.hidden = YES;
}
%end

%hook YTMainAppControlsOverlayView
-(void)layoutSubviews {
	%orig;
	self.playbackRouteButton.hidden = YES;
}
%end
%end



%group GroupNoVoiceSearch
%hook YTSearchTextField
-(void)setVoiceSearchEnabled:(BOOL)arg1 {
	%orig(NO);
}
%end
%end



%group GroupDisableStories
%hook YTReelShelfView
-(double)preferredHeightForRenderer:(id)arg1 {
    return 0;
}
%end

%hook YTReelItemCircularCell
-(id)initWithFrame:(CGRect)arg1 {
    return nil;
}

-(BOOL)isHidden {
    return YES;
}
%end
%end



%group GroupiPadInterface
%hook UIDevice
-(long long)userInterfaceIdiom {
    return YES;
} 
%end

%hook UIStatusBarStyleAttributes
-(long long)idiom {
    return 0;
} 
%end

%hook UIKBTree
-(long long)nativeIdiom {
    return 0;
} 
%end

%hook UIKBRenderer
-(long long)assetIdiom {
    return 0;
} 
%end
%end



%ctor {
	loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.icraze.grogeryprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	if (kEnabled) {
		if (kNoAdsEnabled) %init(GroupNoAds);
		if (kBGPlaybackEnabled) %init(GroupBGPlayback);
		if (kHideWatermarkEnabled) %init(GroupHideWatermark);
		if (kNoDownloadButtonEnabled) %init(GroupNoDLButton);
		if (kHideCastButtonEnabled) %init(GroupHideCastButton);
		if (kDisableVoiceSearchEnabled) %init(GroupNoVoiceSearch);
		if (kDisableStoriesEnabled) %init(GroupDisableStories);
		if (kEnableiPadInterface) %init(GroupiPadInterface);
	}
}
