#import <libactivator/libactivator.h>
@interface RunFieldTestAction : NSObject <LAListener>
@end
@implementation RunFieldTestAction

- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event
{
	[[UIApplication sharedApplication] runFieldTestScript];
	[event setHandled:YES];
}

- (NSString *)activator:(LAActivator *)activator requiresLocalizedGroupForListenerName:(NSString *)listenerName
{
	return @"RunFieldTestAction";
}

- (NSString *)activator:(LAActivator *)activator requiresLocalizedTitleForListenerName:(NSString *)listenerName
{
	return @"RunFieldTestAction";
}

- (NSString *)activator:(LAActivator *)activator requiresLocalizedDescriptionForListenerName:(NSString *)listenerName
{
	return @"Launch FieldTest.app";
}

- (NSArray *)activator:(LAActivator *)activator requiresCompatibleEventModesForListenerWithName:(NSString *)listenerName
{
	return [NSArray arrayWithObjects:@"springboard", @"lockscreen", @"application", nil];
}

+ (void)load
{
	if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.springboard"]) {
		[[%c(LAActivator) sharedInstance] registerListener:[self new] forName:@"com.chikuwa.RunFieldTestAction.send"];
	}
}
@end