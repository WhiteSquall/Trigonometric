#import "cTriangleDrawing.h"
#import "WSTrigonometric.h"

@implementation cTriangleDrawing

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    NSRect itemRect;
    NSBezierPath *linePath;
    NSBezierPath *arcPath;
    
    itemRect.origin.x = 10;
    itemRect.origin.y = 15;
    
    itemRect.size.width = dirtyRect.size.width - 15;
    itemRect.size.height = dirtyRect.size.height - 20;
    
    linePath = [NSBezierPath bezierPath];
    arcPath = [NSBezierPath bezierPath];
    
    [linePath moveToPoint:(NSPoint) itemRect.origin];
    [linePath lineToPoint:(NSPoint) { itemRect.size.width, itemRect.size.height }];
    [linePath lineToPoint:(NSPoint) { itemRect.size.width, itemRect.origin.y }];
    [linePath closePath];
    [linePath setLineWidth: 3];
    [linePath stroke];
    
    WSTrigonometric *myTrigonometric = [[WSTrigonometric alloc] init];
    
    double arcPathAngleA = [myTrigonometric UpdateAngleA:(itemRect.size.width - itemRect.origin.x) :(itemRect.size.height - itemRect.origin.y)];
    double arcPathAngleB = [myTrigonometric UpdateAngleA:(itemRect.size.height - itemRect.origin.y) :(itemRect.size.width - itemRect.origin.x)];
    
    double arcPathRadiusA = (dirtyRect.size.width - itemRect.origin.x) / 5;
    double arcPathRadiusB = (dirtyRect.size.height - itemRect.origin.y) /5;
    
    [arcPath appendBezierPathWithArcWithCenter:(NSPoint)itemRect.origin radius:arcPathRadiusA startAngle:(0.0) endAngle:arcPathAngleA clockwise:NO];
    [arcPath moveToPoint:(NSPoint) { itemRect.size.width, itemRect.size.height }];
    [arcPath appendBezierPathWithArcWithCenter:(NSPoint){itemRect.size.width, itemRect.size.height} radius:arcPathRadiusB startAngle:(-90) endAngle:(-(90) - arcPathAngleB) clockwise:YES];
    [arcPath moveToPoint:(NSPoint) { itemRect.size.width - (itemRect.size.width / 6), itemRect.origin.y}];
    [arcPath lineToPoint:(NSPoint) { itemRect.size.width - (itemRect.size.width / 6), (itemRect.size.height / 6) + itemRect.origin.y }];
    [arcPath lineToPoint:(NSPoint) { itemRect.size.width, (itemRect.size.height / 6) + itemRect.origin.y }];
    [arcPath stroke];
}

@end
