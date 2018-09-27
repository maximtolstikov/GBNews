// Для описания DataProvider

#import "DataProvider.h"
#import "ApiManager.h"
#import "News.h"

@implementation DataProvider

- (void)getNews:(void (^)(NSArray* news))completion {
    [[ApiManager sharedInstance] load:^(NSData * _Nonnull data) {
        NSDictionary* response = data;
        NSDictionary* json = [response valueForKey:@"articles"];
        NSMutableArray* array = [NSMutableArray new];
        if (response) {
            for (NSDictionary* dictionary in json){
                News* news = [[News alloc] initWithDictionary:dictionary];
                [array addObject:news];
            }
        }
        completion(array);
    }];
}

@end
