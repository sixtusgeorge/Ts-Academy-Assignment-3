#!/usr/bin/env bash
set -euo pipefail

echo "=== Running Assignment 3 Grader ==="

# 1. Run Lint
./scripts/lint.sh

# 2. Run Tests
./tests/test.sh

# 3. Run Build & Smoke Tests
./scripts/build.sh

echo "=== ALL ASSIGNMENT 3 GRADER CHECKS PASSED SUCCESSFULLY ==="
