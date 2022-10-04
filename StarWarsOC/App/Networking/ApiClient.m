//
//  ApiClient.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 28/09/22.
//

#import "ApiClient.h"
#import "MenuData.h"

@implementation ApiClient

- (instancetype) initWithSession:(NSURLSession*)session {
    self = [super init];
    _session = session;
    return self;
}

- (void)request:(NSMutableURLRequest*)urlRequest completed:(void(^)(NSDictionary *responseDicctionary))completed {


    NSURLSessionDataTask *dataTask = [_session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      if(httpResponse.statusCode == 200)
      {
        NSError *parseError = nil;
        NSDictionary *responseDicctionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];

          completed(responseDicctionary);
      }
      else
      {
          completed(NULL);
        NSLog(@"Error");
      }
    }];
    [dataTask resume];
}

@end
