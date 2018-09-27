// Для описания хедера списка новостей

#import <UIKit/UIKit.h>
#import "DataProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsListTableViewController : UITableViewController

-(instancetype)initWithDataProvider:(DataProvider*) dataProvider;

@end

NS_ASSUME_NONNULL_END
