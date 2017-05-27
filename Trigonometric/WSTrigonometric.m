#import "WSTrigonometric.h"
#import "math.h"

#define PI 3.14159265

@implementation WSTrigonometric

- (double) UpdateAngleA :(double) tDistanceA :(double) tDistanceB
{
    double AngleA = atan(tDistanceB / tDistanceA) * 180 / PI;
    
    return AngleA;
}

@end
