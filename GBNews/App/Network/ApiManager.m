// Для описания синглтона содержащего методы API

#import "ApiManager.h"
#import <Foundation/Foundation.h>

#define API_TOKEN @"bb7890d5342a4452ac7815d22c3f09d6"
#define HOST @"https://newsapi.org/v2"
#define METHOD_TOP @"/top-headlines"
#define API_KEY @"&apiKey="
#define COUNTRY @"?country=ru"

@implementation ApiManager

// констурктор синглтона
+(instancetype)sharedInstance {
    static ApiManager* instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [ApiManager new];
    });
    return instance;
}

// загрузкa NSData с помощью URLSession
-(void) load:(void(^)(NSData* data))completion {
    [[[NSURLSession sharedSession]
      dataTaskWithURL:[self getUrl] completionHandler:^(NSData * _Nullable data,
                                                        NSURLResponse * _Nullable response,
                                                        NSError * _Nullable error) {
        completion([NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil]);
    }]resume];
}

// внутренний метод конкатенации строки url
-(NSURL*)getUrl {
    NSString* urlString = [NSString
                           stringWithFormat:@"%@%@%@%@%@",
                           HOST,
                           METHOD_TOP,
                           COUNTRY,
                           API_KEY,
                           API_TOKEN];
    return [NSURL URLWithString:urlString];
}

@end
