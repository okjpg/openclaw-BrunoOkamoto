#!/bin/bash
# Build all module PDFs from HTML files
# Usage: bash build.sh [module-number]
# If no argument, builds all modules

DIR="$(cd "$(dirname "$0")" && pwd)"
CSS="$DIR/shared-styles.css"

build_pdf() {
  local html="$1"
  local pdf="${html%.html}.pdf"
  local name=$(basename "$html" .html)
  
  echo "📄 Building $name..."
  google-chrome \
    --headless \
    --disable-gpu \
    --no-sandbox \
    --print-to-pdf="$pdf" \
    --print-to-pdf-no-header \
    "file://$html" 2>/dev/null
  
  if [ -f "$pdf" ]; then
    local size=$(du -h "$pdf" | cut -f1)
    local pages=$(pdfinfo "$pdf" 2>/dev/null | grep Pages | awk '{print $2}')
    echo "  ✅ $name.pdf ($pages pages, $size)"
  else
    echo "  ❌ Failed: $name"
  fi
}

if [ -n "$1" ]; then
  # Build specific module
  html="$DIR/modulo-$(printf '%02d' $1)-*.html"
  for f in $html; do
    [ -f "$f" ] && build_pdf "$f"
  done
else
  # Build all modules
  for html in "$DIR"/modulo-*.html; do
    [ -f "$html" ] && build_pdf "$html"
  done
fi

echo ""
echo "📊 Summary:"
ls -lh "$DIR"/modulo-*.pdf 2>/dev/null | awk '{print "  " $9 " — " $5}'
