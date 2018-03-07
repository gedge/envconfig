#!/usr/bin/env bash

set -xe
banner=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

run_tests() {
    : $banner
    : 'seed the cache with success'
    OOK_KOO=OK  go test -count=1 $1
    : 're-run test to use cache - should output "cached"'
    OOK_KOO=OK  go test          $1
    : 're-run test ignore cache - should not output "cached"'
    OOK_KOO=OK  go test -count=1 $1

    : 'run test with new value - should NOT output "cached" - should fail'
    OOK_KOO=OOK go test          $1 || true Failure here means success
}

: $banner
run_tests ./ook_test.go       Broken version always succeeds
: $banner
run_tests ./ook_fixed_test.go SWITCH TO FIXED VERSION
