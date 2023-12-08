import CollectionsBenchmark

// Create a new benchmark instance.
var benchmark = Benchmark(title: "Storage")
let safeStorage = StorageSafeCasting()
let unsafeStorage = StorageUnsafeCasting()


benchmark.addSimple(
    title: "value as! T",
    input: [Int].self
) { input in
    blackHole(input.forEach({ index in
        guard index < benchmarks.count else { return }
        let work = benchmarks[index]
        work(safeStorage)
    }))
}

benchmark.addSimple(
    title: "unsafeBitCast(value, to: T.self)",
    input: [Int].self
) { input in
    blackHole(input.forEach({ index in
        guard index < benchmarks.count else { return }
        let work = benchmarks[index]
        work(unsafeStorage)
    }))
}

// Execute the benchmark tool with the above definitions.
benchmark.main()


