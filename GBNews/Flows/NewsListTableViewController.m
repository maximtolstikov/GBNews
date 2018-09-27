// Для описания логики отображения списка новостей

#import "NewsListTableViewController.h"
#import "NewsListTableViewCell.h"
#import "News.h"
#import "NewsViewController.h"

#define NewsListCellReuseIdentifier @"NewsCellIdentifier"

@interface NewsListTableViewController ()

@property (nonatomic, strong) NSArray<News*>* arrayNews;
@property (nonatomic, weak) DataProvider* dataProvider;

@end

@implementation NewsListTableViewController

-(instancetype)initWithDataProvider:(DataProvider *)dataProvider {
    self = [super init];
    if (self) {
        self.dataProvider = dataProvider;
        [self.tableView registerClass:[NewsListTableViewCell class]
               forCellReuseIdentifier:NewsListCellReuseIdentifier];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataProvider getNews:^(NSArray * _Nonnull news) {
        dispatch_async(dispatch_get_main_queue(),^{
            self->_arrayNews = news;
            [self.tableView reloadData];
        });
    }];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayNews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NewsListCellReuseIdentifier
                                                                  forIndexPath:indexPath];
    cell.news = [_arrayNews objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsViewController *newsViewController = [[NewsViewController alloc]
                                              initWithNews:[_arrayNews objectAtIndex:indexPath.row]];
[self.navigationController pushViewController:newsViewController animated:true];}

@end
