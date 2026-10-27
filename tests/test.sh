#!/usr/bin/env bash
set -euo pipefail

echo "=== Running Assignment 3 Test Suite (8 Tests) ==="

./app/app.sh help > /dev/null
echo "PASS: test 1 - help command"

./app/app.sh system-info > /dev/null
echo "PASS: test 2 - system-info command"

if ./app/app.sh nonesuchcmd 2>/dev/null; then
    echo "FAIL: invalid command should fail" >&2
    exit 1
else
    echo "PASS: test 3 - invalid command rejected"
fi

if ./app/app.sh check-host 2>/dev/null; then
    echo "FAIL: missing host should fail" >&2
    exit 1
else
    echo "PASS: test 4 - missing host rejected"
fi

./app/app.sh check-host 127.0.0.1 > /dev/null
echo "PASS: test 5 - valid host"

if ./app/app.sh check-port 127.0.0.1 2>/dev/null; then
    echo "FAIL: missing port should fail" >&2
    exit 1
else
    echo "PASS: test 6 - missing port rejected"
fi

if ./app/app.sh check-port 127.0.0.1 abc 2>/dev/null; then
    echo "FAIL: non-numeric port should fail" >&2
    exit 1
else
    echo "PASS: test 7 - non-numeric port rejected"
fi

if ./app/app.sh check-port 127.0.0.1 99999 2>/dev/null; then
    echo "FAIL: out-of-range port should fail" >&2
    exit 1
else
    echo "PASS: test 8 - out-of-range port rejected"
fi

echo "=== ALL 8 TESTS PASSED SUCCESSFULLY ==="
