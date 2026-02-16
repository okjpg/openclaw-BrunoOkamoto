#!/bin/bash
# Helper script to generate module HTML files
# Usage: ./generate-module.sh MODULE_NUM

generate_module() {
    local NUM="$1"
    local TITLE="$2"
    local SUBTITLE="$3"
    local DURATION="$4"
    local FORMAT="$5"
    local KIT="$6"
    
    echo "Generating module-${NUM}..."
}

# We'll use Write tool from Claude instead
echo "Use Claude's Write tool for generation"
