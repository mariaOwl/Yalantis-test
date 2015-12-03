#import <Foundation/Foundation.h>
#import "Article.h"

typedef  void(^ArticlesArrayComplitionBlock) (NSArray* articles, NSError* error);

@interface YalantisAPIManager : NSObject

+ (void)getAllArticlesWithComplitionBlock:(ArticlesArrayComplitionBlock)complitionBlock;

@end
