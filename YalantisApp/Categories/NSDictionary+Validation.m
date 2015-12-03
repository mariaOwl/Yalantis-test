#import "NSDictionary+Validation.h"

@implementation NSDictionary (Validation)

- (NSString *)stringForKey:(id)key
{
    return [self objectForKey:key withClassValidation:[NSString class]];
}

- (NSArray *)arrayForKey:(id)key
{
    return [self objectForKey:key withClassValidation:[NSArray class]];
}

- (id)objectForKey:(id)key withClassValidation:(Class)class{
    id object = [self objectForKey:key];
    if ([object isKindOfClass:class]) {
        return object;
    }
    NSLog(@"couldn't get %@ with key %@ from dictionary %@", NSStringFromClass(class), key, self);
    return nil;
}

- (NSInteger)integerForKey:(id)key
{
    id object = [self objectForKey:key];
    if ([object respondsToSelector:@selector(integerValue)]) {
        return [object integerValue];
    }
    NSLog(@"couldn't get integer with key %@ from dictionary %@", key, self);
    return 0;
}

@end
