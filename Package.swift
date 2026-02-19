// swift-tools-version:5.3
import PackageDescription

// Helper to create a grammar target
func grammarTarget(
    _ name: String,
    path: String,
    sources: [String] = ["src"],
    hasQueries: Bool = true,
    cSettings: [CSetting] = []
) -> Target {
    var settings: [CSetting] = [.headerSearchPath("src")]
    settings.append(contentsOf: cSettings)

    var resources: [Resource] = []
    if hasQueries {
        resources.append(.copy("queries"))
    }

    return .target(
        name: name,
        path: path,
        sources: sources,
        resources: resources.isEmpty ? nil : resources,
        publicHeadersPath: "include",
        cSettings: settings
    )
}

let package = Package(
    name: "TreeSitterGrammars",
    products: [
        .library(name: "TreeSitterJavaScript",     targets: ["TreeSitterJavaScript"]),
        .library(name: "TreeSitterTypeScript",     targets: ["TreeSitterTypeScript"]),
        .library(name: "TreeSitterTSX",            targets: ["TreeSitterTSX"]),
        .library(name: "TreeSitterPython",         targets: ["TreeSitterPython"]),
        .library(name: "TreeSitterSwift",          targets: ["TreeSitterSwift"]),
        .library(name: "TreeSitterRust",           targets: ["TreeSitterRust"]),
        .library(name: "TreeSitterGo",             targets: ["TreeSitterGo"]),
        .library(name: "TreeSitterHTML",           targets: ["TreeSitterHTML"]),
        .library(name: "TreeSitterCSS",            targets: ["TreeSitterCSS"]),
        .library(name: "TreeSitterJSON",           targets: ["TreeSitterJSON"]),
        .library(name: "TreeSitterMarkdown",       targets: ["TreeSitterMarkdown"]),
        .library(name: "TreeSitterMarkdownInline", targets: ["TreeSitterMarkdownInline"]),
        .library(name: "TreeSitterBash",           targets: ["TreeSitterBash"]),
        .library(name: "TreeSitterC",              targets: ["TreeSitterC"]),
        .library(name: "TreeSitterCPP",            targets: ["TreeSitterCPP"]),
        .library(name: "TreeSitterPHP",            targets: ["TreeSitterPHP"]),
        .library(name: "TreeSitterJava",           targets: ["TreeSitterJava"]),
        .library(name: "TreeSitterCSharp",         targets: ["TreeSitterCSharp"]),
        .library(name: "TreeSitterRuby",           targets: ["TreeSitterRuby"]),
        .library(name: "TreeSitterYAML",           targets: ["TreeSitterYAML"]),
        .library(name: "TreeSitterKotlin",         targets: ["TreeSitterKotlin"]),
        .library(name: "TreeSitterSQL",            targets: ["TreeSitterSQL"]),
    ],
    targets: [
        grammarTarget("TreeSitterJavaScript",     path: "grammars/javascript"),
        grammarTarget("TreeSitterTypeScript",     path: "grammars/typescript"),
        grammarTarget("TreeSitterTSX",            path: "grammars/tsx"),
        grammarTarget("TreeSitterPython",         path: "grammars/python"),
        grammarTarget("TreeSitterSwift",          path: "grammars/swift"),
        grammarTarget("TreeSitterRust",           path: "grammars/rust"),
        grammarTarget("TreeSitterGo",             path: "grammars/go"),
        grammarTarget("TreeSitterHTML",           path: "grammars/html"),
        grammarTarget("TreeSitterCSS",            path: "grammars/css"),
        grammarTarget("TreeSitterJSON",           path: "grammars/json"),
        grammarTarget("TreeSitterMarkdown",       path: "grammars/markdown"),
        grammarTarget("TreeSitterMarkdownInline", path: "grammars/markdown-inline"),
        grammarTarget("TreeSitterBash",           path: "grammars/bash"),
        grammarTarget("TreeSitterC",              path: "grammars/c"),
        grammarTarget("TreeSitterCPP",            path: "grammars/cpp"),
        grammarTarget("TreeSitterPHP",            path: "grammars/php"),
        grammarTarget("TreeSitterJava",           path: "grammars/java"),
        grammarTarget("TreeSitterCSharp",         path: "grammars/csharp"),
        grammarTarget("TreeSitterRuby",           path: "grammars/ruby"),
        grammarTarget("TreeSitterYAML",           path: "grammars/yaml"),
        grammarTarget("TreeSitterKotlin",         path: "grammars/kotlin"),
        grammarTarget("TreeSitterSQL",            path: "grammars/sql"),
    ],
    cLanguageStandard: .c11
)
