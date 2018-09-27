// Для описания хедера класса конкретной новости

#import <UIKit/UIKit.h>
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsViewController : UIViewController

-(instancetype)initWithNews:(News*) news;

@end

NS_ASSUME_NONNULL_END
