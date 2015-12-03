#import "ArticleDetailsViewController.h"

@interface ArticleDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ArticleDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.pageURL]];
}

@end
