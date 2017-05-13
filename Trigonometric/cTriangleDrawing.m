#import "cTriangleDrawing.h"

@implementation cTriangleDrawing

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    NSRect itemRect;
    NSBezierPath *linePath;
    
    itemRect.origin.x = 10;
    itemRect.origin.y = 15;
    
    itemRect.size.width = dirtyRect.size.width - 15;
    itemRect.size.height = dirtyRect.size.height - 20;
    
    linePath = [NSBezierPath bezierPath];
    [linePath moveToPoint:itemRect.origin];
    [linePath lineToPoint:(NSPoint) { itemRect.size.width, itemRect.size.height }];
    [linePath lineToPoint:(NSPoint) { itemRect.size.width, itemRect.origin.y }];
    [linePath closePath];
    [linePath setLineWidth: 3];
    [linePath stroke];
}

@end
