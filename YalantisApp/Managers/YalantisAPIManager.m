#import "YalantisAPIManager.h"
#import "NSDictionary+Validation.h"
#import <AFNetworking/AFNetworking.h>

@implementation YalantisAPIManager

+ (void)getAllArticlesWithComplitionBlock:(ArticlesArrayComplitionBlock)complitionBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://yalantis.com/blog" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSArray* articlesDictionaries = [responseObject arrayForKey:@"articles"];
            NSMutableArray* articlesArray = [NSMutableArray arrayWithCapacity:articlesDictionaries.count];
            for (NSDictionary* articleDictionary in articlesDictionaries) {
                Article* article = [[Article alloc] initWithDictionary:articleDictionary];
                [articlesArray addObject:article];
            }
            if (complitionBlock) {
                complitionBlock (articlesArray, nil);
            }
        } else {
#warning TODO
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(complitionBlock) {
            complitionBlock (nil, error);
        }
    }];
}

@end
