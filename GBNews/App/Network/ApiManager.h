// Для описания интерфейса к ApiManager

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ApiManager : NSObject

+(instancetype) sharedInstance;
-(void) load:(void(^)(NSData* data))completion;

@end

NS_ASSUME_NONNULL_END
