#import "Article.h"
#import "NSDictionary+Validation.h"

#define kArticleTitleKey @"title"
#define kArticleCategoryTitleKey @"categoryTitle"
#define kArticleDescriptionTextKey @"descriptionText"
#define kArticleAuthorNameKey @"authorName"
#define kArticleAuthorSurnameKey @"authorSurname"
#define kArticleViewsCountKey @"viewsCount"
#define kArticleImageURLKey @"imageURL"
#define kArticleURLKey @"articleURL"

@implementation Article

- (Article *)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        _title = [dictionary stringForKey:kArticleTitleKey];
        _categoryTitle = [dictionary stringForKey:kArticleCategoryTitleKey];
        _descriptionText = [dictionary stringForKey:kArticleDescriptionTextKey];
        _authorName = [dictionary stringForKey:kArticleAuthorNameKey];
        _authorSurname = [dictionary stringForKey:kArticleAuthorSurnameKey];
        _viewsCount = [dictionary integerForKey:kArticleViewsCountKey];
        _imageURL = [NSURL URLWithString:[dictionary stringForKey:kArticleImageURLKey]];
        _articleURL = [NSURL URLWithString:[dictionary stringForKey:kArticleURLKey]];
    }
    
    return self;
}

@end
