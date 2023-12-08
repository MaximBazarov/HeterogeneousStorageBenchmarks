# HeterogeneousStorageBenchmarks

## Generate
```sh
swift _generate.swift 500
```


## benchmark
```sh
swift run -c release storage-benchmark run --cycles 3 results
```

## render
```sh
swift run -c release storage-benchmark render results chart.png
```