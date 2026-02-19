# locus-tree-sitter-grammars

SPM mirror of tree-sitter grammars for [Locus MVP](https://github.com/beezzoo/locus-mvp).

Single SPM package providing 22 language grammars as individual library products.
No dependency on SwiftTreeSitter — grammars are pure C libraries.

## Usage

```swift
// Package.swift
dependencies: [
    .package(url: "https://github.com/beezzoo/locus-tree-sitter-grammars", from: "1.0.0"),
],
targets: [
    .target(dependencies: [
        .product(name: "TreeSitterJavaScript", package: "locus-tree-sitter-grammars"),
        .product(name: "TreeSitterPython", package: "locus-tree-sitter-grammars"),
        // ... add only the languages you need
    ]),
]
```

## Languages (22)

| Product | Upstream |
|---------|----------|
| TreeSitterJavaScript | tree-sitter/tree-sitter-javascript |
| TreeSitterTypeScript | tree-sitter/tree-sitter-typescript |
| TreeSitterTSX | tree-sitter/tree-sitter-typescript |
| TreeSitterPython | tree-sitter/tree-sitter-python |
| TreeSitterSwift | alex-pinkus/tree-sitter-swift |
| TreeSitterRust | tree-sitter/tree-sitter-rust |
| TreeSitterGo | tree-sitter/tree-sitter-go |
| TreeSitterHTML | tree-sitter/tree-sitter-html |
| TreeSitterCSS | tree-sitter/tree-sitter-css |
| TreeSitterJSON | tree-sitter/tree-sitter-json |
| TreeSitterMarkdown | MDeiml/tree-sitter-markdown |
| TreeSitterMarkdownInline | MDeiml/tree-sitter-markdown |
| TreeSitterBash | tree-sitter/tree-sitter-bash |
| TreeSitterC | tree-sitter/tree-sitter-c |
| TreeSitterCPP | tree-sitter/tree-sitter-cpp |
| TreeSitterPHP | tree-sitter/tree-sitter-php |
| TreeSitterJava | tree-sitter/tree-sitter-java |
| TreeSitterCSharp | tree-sitter/tree-sitter-c-sharp |
| TreeSitterRuby | tree-sitter/tree-sitter-ruby |
| TreeSitterYAML | tree-sitter-grammars/tree-sitter-yaml |
| TreeSitterKotlin | fwcd/tree-sitter-kotlin |
| TreeSitterSQL | DerekStride/tree-sitter-sql |

## Updating

Run `./fetch-grammars.sh` to re-fetch all grammars from upstream.

## License

Each grammar retains its original license. See upstream repositories for details.
