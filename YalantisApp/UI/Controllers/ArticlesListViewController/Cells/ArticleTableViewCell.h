#import <UIKit/UIKit.h>

@interface ArticleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *articleImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *articleDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

+ (NSString*)cellIdentifier;
+ (CGFloat)defaultCellHeight;

@end
