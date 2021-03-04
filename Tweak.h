#import <UIKit/UIKit.h>

@interface YTQTMButton : UIButton
@end

@interface YTRightNavigationButtons
@property(readonly, nonatomic) YTQTMButton *MDXButton;
@property(readonly, nonatomic) YTQTMButton *creationButton;
@end

@interface YTMainAppControlsOverlayView
@property(readonly, nonatomic) YTQTMButton *playbackRouteButton;
@end

@interface YTPivotBarItemView : UIView
@end

static BOOL kEnabled;
static BOOL kNoAdsEnabled;
static BOOL kBGPlaybackEnabled;
static BOOL kHideWatermarkEnabled;
static BOOL kNoDownloadButtonEnabled;
static BOOL kHideCastButtonEnabled;
static BOOL kDisableVoiceSearchEnabled;

static void loadPrefs() {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.icraze.grogeryprefs.plist"];
	kEnabled = [prefs objectForKey:@"kEnabled"] ? [[prefs objectForKey:@"kEnabled"] boolValue] : YES;
	kNoAdsEnabled = [prefs objectForKey:@"kNoAdsEnabled"] ? [[prefs objectForKey:@"kNoAdsEnabled"] boolValue] : YES;
	kBGPlaybackEnabled = [prefs objectForKey:@"kBGPlaybackEnabled"] ? [[prefs objectForKey:@"kBGPlaybackEnabled"] boolValue] : NO;
	kHideWatermarkEnabled = [prefs objectForKey:@"kHideWatermarkEnabled"] ? [[prefs objectForKey:@"kHideWatermarkEnabled"] boolValue] : YES;
	kNoDownloadButtonEnabled = [prefs objectForKey:@"kNoDownloadButtonEnabled"] ? [[prefs objectForKey:@"kNoDownloadButtonEnabled"] boolValue] : NO;
	kHideCastButtonEnabled = [prefs objectForKey:@"kHideCastButtonEnabled"] ? [[prefs objectForKey:@"kHideCastButtonEnabled"] boolValue] : NO;
	kDisableVoiceSearchEnabled = [prefs objectForKey:@"kDisableVoiceSearchEnabled"] ? [[prefs objectForKey:@"kDisableVoiceSearchEnabled"] boolValue] : NO;
}
