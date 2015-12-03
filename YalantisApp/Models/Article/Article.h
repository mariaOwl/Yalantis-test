#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* categoryTitle;
@property (strong, nonatomic) NSString* descriptionText;
@property (strong, nonatomic) NSString* authorName;
@property (strong, nonatomic) NSString* authorSurname;
@property (assign, nonatomic) NSInteger viewsCount;
@property (strong, nonatomic) NSURL* imageURL;
@property (strong, nonatomic) NSURL* articleURL;

- (Article*)initWithDictionary:(NSDictionary*)dictionary;

@end
