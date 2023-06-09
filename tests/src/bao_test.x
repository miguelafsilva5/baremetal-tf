/*
 * Copyright (c) Bao Project and Contributors. All rights reserved
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include "bao_test.h"
#include <stdio.h>
#include <string.h>

#ifndef SUITES
#define SUITES ""
#endif

#ifndef TESTS
#define TESTS ""
#endif

#define DELIMITER _

static const int total_chars = 20;
unsigned int testframework_tests;
unsigned int testframework_fails;

void run_all()
{
    struct bao_test* ptr = (struct bao_test*)&testframework_start;
    while (ptr != (struct bao_test*)&testframework_end) {
        (ptr++)->func_ptr();
    }
}

int run_specific_test(char* suite, char* test)
{
    int count = 0;
    struct bao_test* ptr = (struct bao_test*)&testframework_start;
    while (ptr != (struct bao_test*)&testframework_end) {
        if (!strcmp(ptr->suite_name, suite)) {
            if (!strcmp(ptr->test_name, test)) {
                ptr->func_ptr();
                count++;
            }
        }
        ptr++;
    }
    return count;
}

int run_suite(char* suite)
{
    int count = 0;
    struct bao_test* ptr = (struct bao_test*)&testframework_start;
    while (ptr != (struct bao_test*)&testframework_end) {
        if (strcmp(ptr->suite_name, suite) == 0) {
            ptr->func_ptr();
            count++;
        }
        ptr++;
    }
    return count;
}

void bao_test_entry(void)
{
    char suites[] = SUITES;
    char* suites_end = suites + strlen(suites);
    char* suite_ptr = suites;
    char suite[total_chars];

    char tests[] = TESTS;
    char* tests_end = tests + strlen(tests);
    char* test_ptr = tests;

    int res;
    #define TEST_A 



    #ifdef TEST_A || ABCD
    func_bao_test_TBD_ABCD_TEST_A();
    #endif

    #ifdef TEST_B || ABCD
    func_bao_test_TBD_ABCD_TEST_B();
    #endif

    #ifdef TEST_C || ABCD
    func_bao_test_TBD_ABCD_TEST_C();
    #endif



/*
    //DEPRECATED
    if (strcmp(suites, "all") == 0) {
        run_all();
        BAO_LOG_TESTS();
        return;
    }

    if (strcmp(TESTS, "all") == 0) {
        run_all();
        BAO_LOG_TESTS();
        return;
    }

    if (strlen(SUITES) != 0) {
        while (suite_ptr <= suites_end) {
            sscanf(suite_ptr, "%19s", suite);
            suite_ptr += strlen(suite) + 1;
            res = run_suite(suite);
            if (res == 0) {
                if (TESTF_LOG_LEVEL > 1) {
                    BAO_INFO_TAG();
                    printf("Suite «%s» does not exist.\n", suite);
                }
            }
        }
    }

    if (strlen(TESTS) != 0) {
        while (test_ptr <= tests_end) {
            char test[total_chars];
            sscanf(test_ptr, "%19[^_]%*c%19s", suite, test);
            test_ptr += strlen(test) + 1 + strlen(suite) + 1;
            res = run_specific_test(suite, test);
            if (res == 0) {
                if (TESTF_LOG_LEVEL > 1) {
                    BAO_INFO_TAG();
                    printf("Test «%s» from Suite «%s» does not exist.\n", test,
                        suite);
                }
            }
        }
    }
*/
    if (testframework_tests > 0) {
        BAO_LOG_TESTS();
    } else {
        BAO_INFO_TAG();
        printf("No tests were executed!\n");
    }
    return;
}
