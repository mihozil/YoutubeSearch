//
//  IOSRequest.h
//  IOSRequest
//
//  Created by Apple on 2/7/16.
//  Copyright © 2016 AMOSC. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^requestcompletionhandle)(NSString*,NSError*);
typedef void(^requestDictionaryCompletionHandle) (NSDictionary*);

@interface IOSRequest : NSObject
+ (void) requestPath:(NSString*)path
onCompletionHandle:(requestcompletionhandle) complete;
+ (void) search:(NSString*) keyword
onCompletionHandle: (requestDictionaryCompletionHandle) complete;


@end
