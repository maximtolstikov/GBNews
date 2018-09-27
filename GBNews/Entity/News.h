// Для описания интерфейса модели Новости

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject

@property (nonatomic, strong) NSString* souresName;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* url;
@property (nonatomic, strong) NSString* urlImage;
@property (nonatomic, strong) NSString* publishedAt;
@property (nonatomic, strong) NSString* descriptionNews;
@property (nonatomic, strong) NSString* content;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
