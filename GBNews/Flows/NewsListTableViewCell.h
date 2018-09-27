// Для описания хедера класса ячейки списка новостей

#import <UIKit/UIKit.h>
#import "News.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsListTableViewCell : UITableViewCell

@property (nonatomic, strong) News* news;

@end

NS_ASSUME_NONNULL_END
