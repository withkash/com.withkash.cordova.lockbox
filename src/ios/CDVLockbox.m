#import "CDVLockbox.h"

@implementation CDVLockbox

- (void)setString:(CDVInvokedUrlCommand *)command {
    NSDictionary *options = [command.arguments objectAtIndex:0];
    NSString *key = [options valueForKey:@"key"];
    NSString *value = [options valueForKey:@"value"];

    [Lockbox setString:value forKey:key];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getString:(CDVInvokedUrlCommand *)command {
    NSDictionary *options = [command.arguments objectAtIndex:0];
    NSString *key = [options valueForKey:@"key"];

    NSString *value = [Lockbox stringForKey:key];

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    if (value != nil) {
        [dict setObject:value forKey:@"value"];
    }

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
