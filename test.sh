#!/usr/bin/env bash

IMAGE_NAME="diagnostic-tool"
FAILED=0

echo "=== Building Docker Image ==="
docker build -t "$IMAGE_NAME" . || { echo "Build failed!"; exit 1; }
echo ""

# Helper function to run tests
run_test() {
    local test_name="$1"
    local expected_code="$2"
    shift 2
    local cmd=("$@")

    echo -n "Testing [$test_name]... "
    
    # Run the container and capture its exit code
    docker run --rm "$IMAGE_NAME" "${cmd[@]}" >/dev/null 2>&1
    local actual_code=$?

    if [ "$actual_code" -eq "$expected_code" ]; then
        echo -e "\033[32mPASSED\033[0m (Exit code: $actual_code)"
    else
        echo -e "\033[31mFAILED\033[0m (Expected exit code $expected_code, got $actual_code)"
        FAILED=$((FAILED + 1))
    fi
}

echo "=== Running Docker Tests ==="

# 1. Test 'help' command (Expected exit code: 0)
run_test "help command" 0 help

# 2. Test 'system' command (Expected exit code: 0)
run_test "system command" 0 system

# 3. Test 'disk' command (Expected exit code: 0)
run_test "disk command" 0 disk

# 4. Test 'invalid command' handling (Expected exit code: 2)
run_test "invalid command" 2 non-existent-command

# 5. Test missing argument for network (Expected exit code: 2)
run_test "missing network argument" 2 network

echo ""
if [ "$FAILED" -eq 0 ]; then
    echo -e "\033[32mAll tests passed successfully!\033[0m"
    exit 0
else
    echo -e "\033[31m$FAILED test(s) failed.\033[0m"
    exit 1
fi