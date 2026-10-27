#!/usr/bin/env bash
set -euo pipefail

echo "=== Building Docker Image ==="
docker build -t devops-tool .

echo "=== Running Docker Smoke Tests ==="
echo "Testing 'help' command..."
docker run --rm devops-tool help > /dev/null

echo "Testing 'system-info' command..."
docker run --rm devops-tool system-info > /dev/null

echo "Testing invalid command handling (smoke test)..."
if docker run --rm devops-tool invalid-cmd 2>/dev/null; then
    echo "FAIL: Container should fail on invalid command" >&2
    exit 1
else
    echo "PASS: Container correctly handled invalid command"
fi

echo "=== ALL BUILD & SMOKE TESTS PASSED SUCCESSFULLY ==="
