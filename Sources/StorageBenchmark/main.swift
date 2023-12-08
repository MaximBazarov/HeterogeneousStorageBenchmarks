import CollectionsBenchmark

// Create a new benchmark instance.
var benchmark = Benchmark(title: "Storage")
let safeStorage = StorageSafeCasting()
let unsafeStorage = StorageUnsafeCasting()

// Define a very simple benchmark called `kalimbaOrdered`.
benchmark.addSimple(
    title: "value as! T",
    input: [Int].self
) { input in
    for index in input {
        benchmarks[index](safeStorage)
    }
}

//

//benchmark.addSimple(
//    title: "unsafeBitCast(value, to: T.self)",
//    input: Int.self
//) { input in
//    blackHole(benchmarks[input](unsafeStorage))
//}

// Execute the benchmark tool with the above definitions.
benchmark.main()


