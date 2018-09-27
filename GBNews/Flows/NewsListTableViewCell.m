// Для описания ячейки в списке новостей

#import "NewsListTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NewsListTableViewCell()

@property (nonatomic, strong) UIImageView* newsIcon;
@property (nonatomic, strong) UILabel* titleLable;
@property (nonatomic, strong) UILabel* sourceNameLable;

@end

@implementation NewsListTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _newsIcon = [[UIImageView alloc]initWithFrame:self.bounds];
        _newsIcon.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_newsIcon];
        
        _titleLable = [[UILabel alloc]initWithFrame:self.bounds];
        _titleLable.font = [UIFont systemFontOfSize:18.0 weight:UIFontWeightMedium];
        [self.contentView addSubview:_titleLable];
        
        _sourceNameLable = [[UILabel alloc]initWithFrame:self.bounds];
        _sourceNameLable.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightLight];
        [self.contentView addSubview:_sourceNameLable];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.frame = CGRectMake(0.0,
                                        0.0,
                                        [UIScreen mainScreen].bounds.size.width,
                                        self.frame.size.height);
    _newsIcon.frame = CGRectMake(4.0,
                                 8.0,
                                 100.0,
                                 60.0);
    _titleLable.frame = CGRectMake(108.0,
                                   10.0,
                                   self.contentView.frame.size.width - 120,
                                   30.0);
    _sourceNameLable.frame = CGRectMake(108.0,
                                        48.0,
                                        self.contentView.frame.size.width - 120.0,
                                        20.0);
}

-(void)setNews:(News *)news {
    _news = news;
    
    if (![_news.urlImage isEqual:[NSNull null]]) {
        [_newsIcon sd_setImageWithURL:[NSURL URLWithString:_news.urlImage]];
    }
    
    _sourceNameLable.text = _news.souresName;
    _titleLable.text = _news.title;
}

@end
