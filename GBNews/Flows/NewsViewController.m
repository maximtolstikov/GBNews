// Для описания представления экрана конкретной новости

#import "NewsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NewsViewController ()

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* titleNews;
@property(nonatomic, strong) NSString* url;
@property(nonatomic, strong) NSString* urlToImage;
@property(nonatomic, strong) NSString* publishedAt;
@property(nonatomic, strong) NSString* descriptionNews;
@property(nonatomic, strong) NSString* contentNews;

@end

@implementation NewsViewController

-(instancetype)initWithNews:(News *)news {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _name = news.souresName;
        _titleNews = news.title;
        _url = news.url;
        _urlToImage = news.urlImage;
        _publishedAt = news.publishedAt;
        _descriptionNews = news.descriptionNews;
        _contentNews = news.content;
        self.view.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setSubview];
    
}

-(void)setSubview {
    
    UITextView *titleTextView = [[UITextView alloc] init];
    titleTextView.text = _titleNews;
    [self.view addSubview:titleTextView];
    [titleTextView sizeToFit];
    
    UILabel *titleLable = [[UILabel alloc]
                          initWithFrame:CGRectMake(16,
                                                   100,
                                                   [UIScreen mainScreen].bounds.size.width,
                                                   30)];
    titleLable.backgroundColor = UIColor.cyanColor;
    titleLable.text = _titleNews;
    [self.view addSubview:titleLable];
    
    if (![_urlToImage isEqual:[NSNull null]]) {
        CGFloat side = [UIScreen mainScreen].bounds.size.width;
        CGRect frame = CGRectMake(0.0,
                                  ([UIScreen mainScreen].bounds.size.height / 2) - (side / 2),
                                  side,
                                  side);
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.backgroundColor = UIColor.orangeColor;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView sd_setImageWithURL:[NSURL URLWithString:_urlToImage]];
        [self.view addSubview:imageView];
    }
    
    
    
    
    
    
    
    
    
    NSLog(@"name %@", _name);
    NSLog(@"titleNews %@", _titleNews);
    NSLog(@"url %@", _url);
    NSLog(@"urlToImage %@", _urlToImage);
    NSLog(@"publishedAt %@", _publishedAt);
    NSLog(@"descriptionNews %@", _descriptionNews);
    NSLog(@"contentNews %@", _contentNews);
}

@end
