#import <Foundation/Foundation.h>

@interface NSDictionary (Validation)

- (NSString*)stringForKey:(id)key;
- (NSArray*)arrayForKey:(id)key;

//returns 0 as invalid parameter
- (NSInteger)integerForKey:(id)key;

@end
