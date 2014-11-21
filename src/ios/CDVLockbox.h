#import <Cordova/CDV.h>
#import <Lockbox/Lockbox.h>

@interface CDVLockbox : CDVPlugin

- (void)setString:(CDVInvokedUrlCommand *)command;
- (void)getString:(CDVInvokedUrlCommand *)command;

@end
