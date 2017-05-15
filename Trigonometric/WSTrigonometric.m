#import "WSTrigonometric.h"
#import "math.h"

#define PI 3.14159265

@implementation WSTrigonometric

- (double) UpdateAngleA :(double) DistanceA: (double) DistanceB
{
    double AngleA = atan(DistanceB / DistanceA) * 180 / PI;
    
    return AngleA;
}

@end
