#include "miniunit.h"
#include "ExampleTest.h"

using namespace TestSpace;

int main(){
  MU_RUN_SUITE(ExampleTest::example_test);
	MU_REPORT();
	return minunit_status;
}
