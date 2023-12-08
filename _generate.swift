#!/usr/bin/env swift
import Foundation

let arguments = CommandLine.arguments
var amount = 50
if arguments.count > 1, let amountParameter = Int(arguments[1]) {
    amount = amountParameter
}

print("|GENERATING| \(amount)")

let classesURL = URL(fileURLWithPath: "Sources/StorageBenchmark/Classes.swift")
let benchmarksURL = URL(fileURLWithPath: "Sources/StorageBenchmark/Benchmark.swift")

var listContent = """
import CollectionsBenchmark

let benchmarks: [(Storage) -> Void] = [

"""

var content = ""

for classIndex in 1...amount {
    content += """
        final class ContainerClass_\(classIndex): Container { let index = \(classIndex); var name: String = "\(classIndex)"; }

        """

    listContent.append("""
    {
        let c = $0.get(ContainerClass_\(classIndex).self)
        c.name = "benchmarked"
    },
    
    """)
}

try! content.write(
    to: classesURL,
    atomically: true,
    encoding: .utf8
)

listContent.removeLast(2)
listContent.append("\n]")

try! listContent.write(
    to: benchmarksURL,
    atomically: true,
    encoding: .utf8
)
