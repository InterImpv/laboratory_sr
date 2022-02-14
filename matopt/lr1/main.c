#include "error.h"
#include "func.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

/* ratio */
const double GOLDEN_RATIO = (-1 + sqrt(5)) / 2;
/* epsilon */
const double MAX_EPSILON = 0.00000001;

/* quality of life container */
typedef struct range_container {
	double a, b;
} range_t;

range_t *range_create(void)
{
	range_t *ret = malloc(sizeof(*ret));
	if (NULL == ret) {
		fprintf(stderr, "ERR %u: failed to initalize <range_t>\n", E_INIT);
		return NULL;
	}
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
		x1 = a + (b - a) * GOLDEN_RATIO;
		x2 = b - (b - a) * GOLDEN_RATIO;

		/* find by condition */
		if (condition(func(x1), func(x2)))
			a = x2;
		else
			b = x1;

		printf("[%u]:\ta = %.5lf,\tb = %.5lf\n", i + 1, a, b);
	}
	range_set(this, a, b);

	return E_OK;
}

int main(int argc, char **argv)
{
	/* should've used <argp.h>, but it bloats everything */
	if (argc != 5) {
		fprintf(stderr, "ERR %u: not enough arguments\n", E_ARG);
		printf("Usage\n\n\t./main [min|max] <a> <b> <eps>\n\n");
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
	if (accuracy < MAX_EPSILON) {
		fprintf(stderr, "ERR %u: invalid accuracy \"%.8lf\"\n", E_ARG, accuracy);
		return E_ARG;
	}

	range_t *range = range_create();
	if (NULL == range)
		return E_INIT;

	range_set(range, a, b);

	/* find optimum */
	if (min_max)
		div_gratio(range, func, is_max_double, accuracy);
	else
		div_gratio(range, func, is_min_double, accuracy);

	/* the result */
	double x = range->a + (range->b - range->a) / 2;

	printf("\n");
	printf("Ratio:\tr = %.8lf\n", GOLDEN_RATIO);
	printf("Range:\ta = %.8lf,\tb = %.8lf\n", range->a, range->b);
	printf("Center:\tx = %.8lf,\ty = %.8lf\n", x, func(x));

	range_free(range);

	return E_OK;
}
