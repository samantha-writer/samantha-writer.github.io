#!/bin/bash
# Image optimization script for Jekyll blog
# This script converts images to WebP format for better performance

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Image Optimization Script ===${NC}"

# Check if cwebp is installed
if ! command -v cwebp &> /dev/null; then
    echo -e "${YELLOW}cwebp not found. Installing...${NC}"

    # Check if Homebrew is available
    if command -v brew &> /dev/null; then
        echo "Installing webp via Homebrew..."
        brew install webp
    else
        echo -e "${RED}Error: Homebrew not found. Please install Homebrew first:${NC}"
        echo "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
fi

# Navigate to blog directory
BLOG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$BLOG_DIR"

echo -e "${GREEN}Blog directory: $BLOG_DIR${NC}"

# Count images
TOTAL_JPG=$(find assets/images -type f \( -name "*.jpg" -o -name "*.jpeg" \) | wc -l | xargs)
TOTAL_PNG=$(find assets/images -type f -name "*.png" | wc -l | xargs)
TOTAL_IMAGES=$((TOTAL_JPG + TOTAL_PNG))

echo -e "${GREEN}Found $TOTAL_IMAGES images (JPG: $TOTAL_JPG, PNG: $TOTAL_PNG)${NC}"

# Convert JPG/JPEG to WebP
echo -e "${YELLOW}Converting JPG/JPEG images...${NC}"
CONVERTED=0

find assets/images -type f \( -name "*.jpg" -o -name "*.jpeg" \) | while read img; do
    webp_img="${img%.*}.webp"

    if [ ! -f "$webp_img" ]; then
        cwebp -q 85 "$img" -o "$webp_img" 2>/dev/null
        if [ $? -eq 0 ]; then
            CONVERTED=$((CONVERTED + 1))
            echo "  ✓ ${img##*/} → ${webp_img##*/}"
        fi
    else
        echo "  ⊙ ${webp_img##*/} already exists, skipping"
    fi
done

# Convert PNG to WebP
echo -e "${YELLOW}Converting PNG images...${NC}"

find assets/images -type f -name "*.png" | while read img; do
    webp_img="${img%.*}.webp"

    if [ ! -f "$webp_img" ]; then
        cwebp -q 90 "$img" -o "$webp_img" 2>/dev/null
        if [ $? -eq 0 ]; then
            CONVERTED=$((CONVERTED + 1))
            echo "  ✓ ${img##*/} → ${webp_img##*/}"
        fi
    else
        echo "  ⊙ ${webp_img##*/} already exists, skipping"
    fi
done

echo -e "${GREEN}=== Conversion complete! ===${NC}"
echo -e "${GREEN}Next steps:${NC}"
echo "1. Test your site locally: bundle exec jekyll serve"
echo "2. Check image loading in browser"
echo "3. Commit changes: git add . && git commit -m 'Optimize images to WebP'"
echo ""
echo -e "${YELLOW}Note: Original images are kept for fallback support${NC}"
