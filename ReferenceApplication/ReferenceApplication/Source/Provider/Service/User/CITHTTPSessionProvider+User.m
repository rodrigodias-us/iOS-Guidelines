//
//  CITHTTPSessionManager+User.m
//  ReferenceApplication
//
//  Created by SwatTeam on 1/22/16.
//  Copyright © 2016 CI&T. All rights reserved.
//

#import "CITHTTPSessionProvider+User.h"
#import "CITLogging.h"

@implementation CITHTTPSessionProvider (User)

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
                  success:(CITRequestOperationBlockSuccess)success
                  failure:(CITRequestOperationBlockFailure)failure {
    NSString *loginProfileUser = [self loginEndpoint];
    
    NSDictionary *parameters = @{@"username": username,
                                 @"password": password};
    
    [self GET:loginProfileUser
   parameters:parameters
     progress:nil
      success:success
      failure:^(NSURLSessionDataTask *task, NSError *error) {
          
          AFHTTPRequestSerializer *serializer = self.requestSerializer;
          [serializer clearAuthorizationHeader];
          
          DLog(@"Request error: %@", error.description);
          failure(error);
      }];
}


#pragma mark - EndPoints

- (NSString *)loginEndpoint {
    NSString *endpoint = [self setEndpointVersion:@"login"];
    
    return endpoint;
}

@end
