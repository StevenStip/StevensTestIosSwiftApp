//
// Copyright (c) 2016 deltaDNA Ltd. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "DDNASettings.h"

NSString *const DDNA_SDK_VERSION = @"iOS SDK v4.0.0";
NSString *const DDNA_ENGAGE_API_VERSION = @"4";

NSString *const DDNA_EVENT_STORAGE_PATH = @"{persistent_path}";
NSString *const DDNA_ENGAGE_STORAGE_PATH = @"{persistent_path}";
NSString *const DDNA_COLLECT_URL_PATTERN = @"{host}/{env_key}/bulk";
NSString *const DDNA_COLLECT_HASH_URL_PATTERN = @"{host}/{env_key}/bulk/hash/{hash}";
NSString *const DDNA_ENGAGE_URL_PATTERN = @"{host}/{env_key}";
NSString *const DDNA_ENGAGE_HASH_URL_PATTERN = @"{host}/{env_key}/hash/{hash}";

NSUInteger const DDNA_MAX_EVENT_STORE_BYTES = 1024 * 1024 * 4;

@implementation DDNASettings

- (id) init
{
    // Defines the default behaviour of the SDK.
    if ((self = [super init]))
    {        
        self.onFirstRunSendNewPlayerEvent = YES;
        self.onStartSendClientDeviceEvent = YES;
        self.onStartSendGameStartedEvent = YES;
        
        self.httpRequestRetryDelaySeconds = 2;
        self.httpRequestMaxTries = 5;
        self.httpRequestCollectTimeoutSeconds = 20;
        self.httpRequestEngageTimeoutSeconds = 5;
        
        self.backgroundEventUpload = YES;
        self.backgroundEventUploadStartDelaySeconds = 0;
        self.backgroundEventUploadRepeatRateSeconds = 60;
        
        #if TARGET_OS_TV
        self.useEventStore = NO;
        #else
        self.useEventStore = YES;
        #endif
    }
    return self;
}

+ (NSString *)getPrivateSettingsDirectoryPath
{
    // Recommended location for storing user application files.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"DeltaDNA"];
    return documentsDirectory;
}

@end