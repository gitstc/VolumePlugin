#import <Cordova/CDV.h>
#import "VolumePlugin.h"

@implementation VolumePlugin {
    MPVolumeView *mpVolumeView;
    UISlider* volumeSlider;
}

- (void)getVolume:(CDVInvokedUrlCommand*)command
{
    /*CDVPluginResult* pluginResult;

    @try {
        float volume = [MPMusicPlayerController applicationMusicPlayer].volume;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:(double)volume];
    }
    @catch(NSException *ex){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:ex.description];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    */

    CDVPluginResult* pluginResult;
    @try {
        if(!mpVolumeView){
            mpVolumeView = [[MPVolumeView alloc] initWithFrame:CGRectMake(-100,-100,1,1)];
            //mpVolumeView.showsRouteButton = YES;
            mpVolumeView.showsVolumeSlider = YES;
            [self.webView.superview addSubview:mpVolumeView];

            for (UIView *view in [mpVolumeView subviews]){
                if ([view.class.description isEqualToString:@"MPVolumeSlider"]){
                    volumeSlider = (UISlider*)view;
                    break;
                }
            }
        }

        [volumeSlider sendActionsForControlEvents:UIControlEventTouchUpInside];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:(double)volumeSlider.value];       
    }
    @catch(NSException *ex) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:ex.description];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setVolume:(CDVInvokedUrlCommand*)command
{
    /*CDVPluginResult* pluginResult;

    @try {
        float volume = [command.arguments[0] floatValue];
        [[MPMusicPlayerController applicationMusicPlayer] setVolume:volume];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }
    @catch(NSException *ex){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:ex.description];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    */
    
    CDVPluginResult* pluginResult;
    @try {
        float volume = [command.arguments[0] floatValue];

        if(!mpVolumeView){
            mpVolumeView = [[MPVolumeView alloc] initWithFrame:CGRectMake(-100,-100,1,1)];
            //mpVolumeView.showsRouteButton = YES;
            mpVolumeView.showsVolumeSlider = YES;
            [self.webView.superview addSubview:mpVolumeView];

            for (UIView *view in [mpVolumeView subviews]){
                if ([view.class.description isEqualToString:@"MPVolumeSlider"]){
                    volumeSlider = (UISlider*)view;
                    break;
                }
            }
        }

        [volumeSlider setValue:volume animated:NO];
        [volumeSlider sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    @catch(NSException *ex) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:ex.description];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
