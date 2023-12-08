# HeterogeneousStorageBenchmarks

## Generate
```sh
rm results ||  rm chart.png ||  swift run -c release storage-benchmark run results --cycles 1  && swift run -c release storage-benchmark render results chart.png && open chart.png
```
