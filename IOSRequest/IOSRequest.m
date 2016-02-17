//
//  IOSRequest.m
//  IOSRequest
//
//  Created by Apple on 2/7/16.
//  Copyright © 2016 AMOSC. All rights reserved.
//

#import "IOSRequest.h"

@implementation IOSRequest
+ (void) requestPath:(NSString *)path onCompletionHandle:(requestcompletionhandle)complete{
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:path] completionHandler:^(NSData*data, NSURLResponse*respond, NSError*error){
        NSString*result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        if (complete) complete(result, error);
    }] resume];
}
+ (void) search:(NSString *)keyword onCompletionHandle:(requestDictionaryCompletionHandle)complete{
    NSString *keypath = [NSString stringWithFormat:@"https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=5&q=%@&type=video&key=AIzaSyDPfwm5dCorP8WvhJvpj4VhBtoEqPSzv58",keyword];
    
    [IOSRequest requestPath:keypath onCompletionHandle:^(NSString*result, NSError* error){

        if ((error) || ([result isEqualToString:@""])){
            if (complete) complete(nil);
        }else{
            NSData *data = [result dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *Jsondata = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            if (complete) complete(Jsondata);
            
        }
    }];
}
@end
