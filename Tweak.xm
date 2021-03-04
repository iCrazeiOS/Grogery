#import "Tweak.h"

%hook YTAdsPlayerModule
-(void)configureWithBinder:(id)arg1 {
	if (!kNoAdsEnabled) %orig;
}
%end

%hook YTAdsInnerTubeContextDecorator
-(void)decorateContext:(id)arg1 {
	if (!kNoAdsEnabled) %orig;
}
%end

%hook YTIPlayabilityStatus
-(BOOL)isPlayableInBackground {
	return kBGPlaybackEnabled;
}
%end

%hook YTMainAppVideoPlayerOverlayViewController
-(void)setFeaturedChannelWatermarkImageView:(id)arg1 {
	if (!kHideWatermarkEnabled) %orig;
} 
%end

%hook YTTransferButton
-(void)setVisible:(BOOL)arg1 dimmed:(BOOL)arg2 {
	kNoDownloadButtonEnabled ? %orig(NO, arg2) : %orig;
}
%end

%hook YTSettings
-(BOOL)disableMDXDeviceDiscovery {
	return kHideCastButtonEnabled ? YES : %orig;
} 
%end

%hook YTRightNavigationButtons
-(void)layoutSubviews {
	%orig;
	if (kHideCastButtonEnabled) self.MDXButton.hidden = YES;
}
%end

%hook YTMainAppControlsOverlayView
-(void)layoutSubviews {
	%orig;
	if (kHideCastButtonEnabled) self.playbackRouteButton.hidden = YES;
}
%end

%hook YTSearchTextField
-(void)setVoiceSearchEnabled:(BOOL)arg1 {
	kDisableVoiceSearchEnabled ? %orig(NO) : %orig;
}
%end

%ctor {
	loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.icraze.grogeryprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	if (kEnabled) %init;
}
