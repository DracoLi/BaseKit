//
// Created by Bruno Wernimont on 2012
// Copyright 2012 BaseKit
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "BKNetworkClient.h"

#import "BKMacros.h"

static BKNetworkClient *_networkclient = nil;


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BKNetworkClient


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (id )sharedClient {
    return _networkclient;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setSharedClient:(id)client {
    if (_networkclient != client) {
        BK_RELEASE(_networkclient);
        _networkclient = BK_RETAIN(client);
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)clientWithBaseURL:(NSString *)URL {
    id client = [[self alloc] initWithBaseURL:[NSURL URLWithString:URL]];
    return BK_AUTORELEASE(client);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    
    if (self) {
        // Set default network client if no one set
        if ([BKNetworkClient sharedClient] == nil) {
            [BKNetworkClient setSharedClient:self];
        }
    }
    
    return self;
}

@end
