/* helper functions */
#include <stdbool.h>
#include <math.h>

double func(double x)
{
	return (-pow(x, 2) + 2);
}

bool is_max_double(double a, double b)
{
	return (a <= b);
}

bool is_min_double(double a, double b)
{
	return (a >= b);
}
