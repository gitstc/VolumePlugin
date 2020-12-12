#import <Cordova/CDV.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VolumePlugin: CDVPlugin {
}

- (void)getVolume:(CDVInvokedUrlCommand*)command;
- (void)setVolume:(CDVInvokedUrlCommand*)command;

@end