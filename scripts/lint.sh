#!/usr/bin/env bash
set -euo pipefail

echo "=== Running Lint Check ==="

REQUIRED_FILES=(
    "app/app.sh"
    "scripts/lint.sh"
    "scripts/build.sh"
    "tests/test.sh"
    "Dockerfile"
    "compose.yaml"
    ".dockerignore"
    ".github/workflows/ci.yml"
    "grade.sh"
    "README.md"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "FAIL: Required file missing: $file" >&2
        exit 1
    fi
    echo "PASS: Found $file"
done

# Run bash syntax check on all shell scripts
SHELL_SCRIPTS=$(find . -name "*.sh")
for script in $SHELL_SCRIPTS; do
    bash -n "$script"
    echo "PASS: Bash syntax OK for $script"
done

echo "=== ALL LINT CHECKS PASSED SUCCESSFULLY ==="
