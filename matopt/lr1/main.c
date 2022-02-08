#include "error.h"
#include "func.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

/* ratio */
const double GOLDEN_RATIO = (1 + sqrt(5)) / 2;
const double INV_GOLDEN_RATIO = 1 / GOLDEN_RATIO;

/* quality of life container */
typedef struct range_container {
	double a, b;
} range_t;

range_t *range_create(void)
{
	range_t *ret = malloc(sizeof(*ret));
	assert(NULL != ret);

	return ret;
}

enum GEN_ERR range_set(range_t *this, double a, double b)
{
	if (NULL == this) {
		fprintf(stderr, "ERR %u: tried to set NULL object\n", E_ARG);
		return E_ARG;
	}
	this->a = a;
	this->b = b;

	return E_OK;
}

enum GEN_ERR range_free(range_t *this)
{
	if (NULL == this) {
		fprintf(stderr, "ERR %u: tried to free NULL object\n", E_ARG);
		return E_ARG;
	}
	free(this);

	return E_OK;;
}

/* finds a given range criteria of a given function */
enum GEN_ERR div_gratio(range_t *this, double (*func_ptr)(double), bool (*condition)(double, double), double eps)
{
	if (NULL == this) {
		fprintf(stderr, "ERR %u: tried to work with NULL object\n", E_ARG);
		return E_ARG;
	}
	/*if (this->a > this->b) {
		fprintf(stderr, "ERR %u: invalid range, a > b\n", E_ARG);
		return E_ARG;
	}*/

	/* end points */
	double a = this->a;
	double b = this->b;
	/* division temp points */
	double x1, x2;

	/* iterate until epsilon is satisfied */
	for (uint32_t i = 0; fabs(b - a) > eps; i++) {
		x1 = b - (b - a) * INV_GOLDEN_RATIO;
		x2 = a + (b - a) * INV_GOLDEN_RATIO;

		/* find by condition */
		if (condition(func(x1), func(x2)))
			a = x1;
		else
			b = x2;

		printf("[%u]:\ta = %.5lf,\tb = %.5lf\n", i, a, b);
	}
	range_set(this, a, b);

	return E_OK;
}

int main(int argc, char **argv)
{
	if (argc != 5) {
		fprintf(stderr, "ERR %u: not enough arguments\n", E_ARG);
		return E_ARG;
	}

	/* check given criteria */
	bool min_max;
	if (!strcmp("min", argv[1])) {
		min_max = false;
	} else if (!strcmp("max", argv[1])) {
		min_max = true;
	} else {
		fprintf(stderr, "ERR %u: unknown condition \"%s\"\n", E_ARG, argv[1]);
		return E_ARG;
	}

	/* end points */
	double a = atof(argv[2]);
	double b = atof(argv[3]);
	/* accuracy */
	double accuracy = atof(argv[4]);
	if (accuracy < 0.00000001) {
		fprintf(stderr, "ERR %u: invalid accuracy \"%.8lf\"\n", E_ARG, accuracy);
		return E_ARG;
	}

	range_t *range = range_create();
	range_set(range, a, b);

	/* find optimum */
	if (min_max)
		div_gratio(range, func, is_max_double, accuracy);
	else
		div_gratio(range, func, is_min_double, accuracy);

	/* the result */
	double x = range->a + (range->b - range->a) / 2;

	printf("\n");
	printf("Ratio:\tr = %.8lf, i = %.8lf\n", GOLDEN_RATIO, INV_GOLDEN_RATIO);
	printf("Range:\ta = %.8lf, b = %.8lf\n", range->a, range->b);
	printf("Center:\tx = %.8lf, f(x) = %.8lf\n", x, func(x));

	range_free(range);

	return E_OK;
}
