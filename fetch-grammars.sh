#!/usr/bin/env bash
set -euo pipefail

# Fetch tree-sitter grammars from upstream repos
# Usage: ./fetch-grammars.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
GRAMMARS_DIR="$SCRIPT_DIR/grammars"
TMP_DIR=$(mktemp -d)

trap 'rm -rf "$TMP_DIR"' EXIT

fetch_grammar() {
    local name="$1"        # e.g. "javascript"
    local repo="$2"        # e.g. "tree-sitter/tree-sitter-javascript"
    local ref="$3"         # tag or branch
    local subdir="$4"      # subdirectory within repo (empty = root)
    local header_name="$5" # e.g. "TreeSitterJavaScript"
    local header_file="$6" # e.g. "javascript.h" (the function declaration header)

    echo "==> Fetching $name from $repo@$ref${subdir:+ ($subdir)}"

    local dest="$GRAMMARS_DIR/$name"
    rm -rf "$dest"
    mkdir -p "$dest/src" "$dest/include/$header_name" "$dest/queries"

    local tarball="$TMP_DIR/${name}.tar.gz"
    curl -sL "https://github.com/$repo/archive/refs/tags/$ref.tar.gz" -o "$tarball" 2>/dev/null || \
    curl -sL "https://github.com/$repo/archive/$ref.tar.gz" -o "$tarball"

    local extract_dir="$TMP_DIR/${name}-extract"
    mkdir -p "$extract_dir"
    tar xzf "$tarball" -C "$extract_dir" --strip-components=1

    # Source directory within extracted archive
    local src_root="$extract_dir"
    [ -n "$subdir" ] && src_root="$extract_dir/$subdir"

    # Copy C sources
    cp "$src_root/src/parser.c" "$dest/src/" 2>/dev/null || true
    cp "$src_root/src/scanner.c" "$dest/src/" 2>/dev/null || true
    # Some grammars have scanner.cc (C++ scanner)
    if [ -f "$src_root/src/scanner.cc" ]; then
        cp "$src_root/src/scanner.cc" "$dest/src/"
    fi

    # Copy tree_sitter directory (contains alloc.h, array.h, parser.h)
    if [ -d "$src_root/src/tree_sitter" ]; then
        cp -r "$src_root/src/tree_sitter" "$dest/src/"
    fi

    # Copy queries
    if [ -d "$src_root/queries" ]; then
        cp "$src_root/queries/"*.scm "$dest/queries/" 2>/dev/null || true
    fi

    # Create umbrella header
    # Find the function name from parser.c
    local func_name
    func_name=$(grep -o 'tree_sitter_[a-z_]*' "$dest/src/parser.c" | head -1 || echo "tree_sitter_${name}")

    cat > "$dest/include/$header_name/$header_file" <<EOF
#ifndef TREE_SITTER_${header_name}_H_
#define TREE_SITTER_${header_name}_H_

#include <stdlib.h>

typedef struct TSLanguage TSLanguage;

#ifdef __cplusplus
extern "C" {
#endif

const TSLanguage *${func_name}(void);

#ifdef __cplusplus
}
#endif

#endif // TREE_SITTER_${header_name}_H_
EOF

    # If queries dir is empty, add a placeholder so SPM resource copy works
    if [ -z "$(ls -A "$dest/queries/" 2>/dev/null)" ]; then
        rm -rf "$dest/queries"
    fi

    echo "    OK: $dest"
}

# Clean
rm -rf "$GRAMMARS_DIR"

# Fetch all grammars
# Format: name repo ref subdir header_name header_file

fetch_grammar "javascript" \
    "tree-sitter/tree-sitter-javascript" "v0.23.1" "" \
    "TreeSitterJavaScript" "javascript.h"

fetch_grammar "typescript" \
    "tree-sitter/tree-sitter-typescript" "v0.23.2" "typescript" \
    "TreeSitterTypeScript" "typescript.h"

fetch_grammar "tsx" \
    "tree-sitter/tree-sitter-typescript" "v0.23.2" "tsx" \
    "TreeSitterTSX" "tsx.h"

fetch_grammar "python" \
    "tree-sitter/tree-sitter-python" "v0.23.6" "" \
    "TreeSitterPython" "python.h"

fetch_grammar "swift" \
    "alex-pinkus/tree-sitter-swift" "0.7.1-with-generated-files" "" \
    "TreeSitterSwift" "swift.h"

fetch_grammar "rust" \
    "tree-sitter/tree-sitter-rust" "v0.24.0" "" \
    "TreeSitterRust" "rust.h"

fetch_grammar "go" \
    "tree-sitter/tree-sitter-go" "v0.23.4" "" \
    "TreeSitterGo" "go.h"

fetch_grammar "html" \
    "tree-sitter/tree-sitter-html" "v0.23.2" "" \
    "TreeSitterHTML" "html.h"

fetch_grammar "css" \
    "tree-sitter/tree-sitter-css" "v0.23.2" "" \
    "TreeSitterCSS" "css.h"

fetch_grammar "json" \
    "tree-sitter/tree-sitter-json" "v0.24.8" "" \
    "TreeSitterJSON" "json.h"

fetch_grammar "markdown" \
    "MDeiml/tree-sitter-markdown" "v0.4.1" "tree-sitter-markdown" \
    "TreeSitterMarkdown" "markdown.h"

fetch_grammar "markdown-inline" \
    "MDeiml/tree-sitter-markdown" "v0.4.1" "tree-sitter-markdown-inline" \
    "TreeSitterMarkdownInline" "markdown_inline.h"

fetch_grammar "bash" \
    "tree-sitter/tree-sitter-bash" "v0.23.3" "" \
    "TreeSitterBash" "bash.h"

fetch_grammar "c" \
    "tree-sitter/tree-sitter-c" "v0.23.5" "" \
    "TreeSitterC" "c.h"

fetch_grammar "cpp" \
    "tree-sitter/tree-sitter-cpp" "v0.23.4" "" \
    "TreeSitterCPP" "cpp.h"

fetch_grammar "php" \
    "tree-sitter/tree-sitter-php" "v0.23.11" "php" \
    "TreeSitterPHP" "php.h"

fetch_grammar "java" \
    "tree-sitter/tree-sitter-java" "v0.23.5" "" \
    "TreeSitterJava" "java.h"

fetch_grammar "csharp" \
    "tree-sitter/tree-sitter-c-sharp" "v0.23.1" "" \
    "TreeSitterCSharp" "c_sharp.h"

fetch_grammar "ruby" \
    "tree-sitter/tree-sitter-ruby" "v0.23.1" "" \
    "TreeSitterRuby" "ruby.h"

fetch_grammar "yaml" \
    "tree-sitter-grammars/tree-sitter-yaml" "v0.7.0" "" \
    "TreeSitterYAML" "yaml.h"

fetch_grammar "kotlin" \
    "fwcd/tree-sitter-kotlin" "0.3.8" "" \
    "TreeSitterKotlin" "kotlin.h"

fetch_grammar "sql" \
    "DerekStride/tree-sitter-sql" "v0.3.3" "" \
    "TreeSitterSQL" "sql.h"

echo ""
echo "Done! All grammars fetched to $GRAMMARS_DIR"
