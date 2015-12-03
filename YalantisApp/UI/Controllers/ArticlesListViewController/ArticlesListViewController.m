#import "ArticlesListViewController.h"
#import "ArticleTableViewCell.h"
#import "YalantisAPIManager.h"
#import "ArticleDetailsViewController.h"
#import <UIImageView+AFNetworking.h>

@interface ArticlesListViewController ()
<
    UITableViewDataSource
    ,UITableViewDelegate
>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray* articles;

@end

@implementation ArticlesListViewController

#pragma mark - view lifecircle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //table setup
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ArticleTableViewCell class])
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:[ArticleTableViewCell cellIdentifier]];
    
    //for dynamic cells height
    self.tableView.estimatedRowHeight = [ArticleTableViewCell defaultCellHeight];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [YalantisAPIManager getAllArticlesWithComplitionBlock:^(NSArray *articles, NSError *error) {
        if (!error){
            self.articles = articles;
            [self.tableView reloadData];
        }
        else {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                                            message:error.localizedDescription
                                                           delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    self.articles = nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[ArticleTableViewCell cellIdentifier]];
    
    Article* article = self.articles[indexPath.row];
    cell.categoryLabel.text = article.categoryTitle;
    cell.titleLabel.text = article.title;
    cell.descriptionLabel.text = article.descriptionText;
    cell.articleDetailsLabel.text = [NSString stringWithFormat:NSLocalizedString(@"By %@ %@・ %d views", nil),article.authorName, article.authorSurname, article.viewsCount];
    [cell.articleImageView setImageWithURL:article.imageURL];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Article* article = self.articles[indexPath.row];
    ArticleDetailsViewController* articleDetailsViewController = [[ArticleDetailsViewController alloc] init];
    articleDetailsViewController.pageURL = article.articleURL;
    [self.navigationController pushViewController:articleDetailsViewController animated:YES];
}

@end
