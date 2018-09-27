// Для описания интерфейса DataProvider

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataProvider : NSObject

- (void)getNews:(void (^)(NSArray* news))completion;

@end

NS_ASSUME_NONNULL_END
