#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <math.h>
 
const double_t GOLDEN_RATIO = (1 + sqrt(5)) / 2;

double_t func(double_t x)
{
  return (-pow(x - 1, 2) + 10);
}

bool is_max_double(double_t a, double_t b)
{
	return (a <= b);
}
 
int main(int argc, char **argv)
{
	/* end points */
	double_t a = -10;
	double_t b = 10;
	/* accuracy */
	double_t accuracy = 0.01;
	/* division points */
	double_t x1, x2;
	
	for (uint32_t i = 0; fabs(b - a) > accuracy; i++) {
		x1 = b - (b - a) / GOLDEN_RATIO; 
		x2 = a + (b - a) / GOLDEN_RATIO;
		
		/* find max */
		if (is_max_double(func(x1), func(x2)))
			a = x1; 
		else 
			b = x2;
			
		printf("[%u]:\ta = %.5lf,\tb = %.5lf\n", i, a, b);
	}
	
	double_t x = a + (b - a) / 2;
	
	printf("\n");
	printf("Lower:\tx = %.5lf,\tf(x) = %.5lf\n", a, func(a));
	printf("Center:\tx = %.5lf,\tf(x) = %.5lf\n", x, func(x));
	printf("Upper:\tx = %.5lf,\tf(x) = %.5lf\n", b, func(b));
	
	return 0;
}


