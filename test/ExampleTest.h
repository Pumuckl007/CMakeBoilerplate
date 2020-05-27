#pragma once
#include "miniunit.h"

namespace TestSpace {
  namespace ExampleTest{
    MU_TEST(first_test){
      mu_assert_int_eq(0, 1);
    }

    MU_TEST_SUITE(example_test){
      MU_RUN_TEST(first_test);
    }
  }
}
