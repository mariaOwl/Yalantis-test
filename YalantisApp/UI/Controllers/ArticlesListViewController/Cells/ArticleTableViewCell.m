#import "ArticleTableViewCell.h"

@implementation ArticleTableViewCell

+ (NSString *)cellIdentifier
{
    return NSStringFromClass([ArticleTableViewCell class]);
}

+ (CGFloat)defaultCellHeight {
    return 257.0f;
}

@end
