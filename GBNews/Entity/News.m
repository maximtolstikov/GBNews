// Для описания модели Новости

#import "News.h"

@implementation News

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        NSDictionary* source = [dictionary valueForKey:@"source"];
        if (source && ![source isEqual:[NSNull null]]) {
            NSString* name = [source valueForKey:@"name"];
            if (![name isEqual:[NSNull null]]) {
                _souresName = name;
            }
        }
        _title = [dictionary valueForKey:@"title"];
        _url = [dictionary valueForKey:@"url"];
        _urlImage = [dictionary valueForKey:@"urlToImage"];
        _publishedAt = [dictionary valueForKey:@"publishedAt"];
        _descriptionNews = [dictionary valueForKey:@"description"];
        _content = [dictionary valueForKey:@"content"];
    }
    
    return self;
}

@end
