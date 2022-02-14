/* helper functions */
#include <stdbool.h>
#include <math.h>

/*
 * cosine -> { -3 pi / 2, 3 pi / 2 }, x = +-4.7123
 * sine -> { 0, 2 pi }
 * x ^ 2, -x ^ 2
 * x ^ 3 + 2 x ^ 2 -> { -1.5, 0.5 }
 */

double func(double x)
{
	return (pow(x - 2, 2));
}

bool is_max_double(double a, double b)
{
	return (a >= b);
}

bool is_min_double(double a, double b)
{
	return (a <= b);
}
