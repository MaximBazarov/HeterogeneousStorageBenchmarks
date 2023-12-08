# HeterogeneousStorageBenchmarks

## Generate
```sh
swift _generate.swift 10000
rm results \
|| rm chart.png \
|| swift run -c release storage-benchmark run results --max-size 10000 --cycles 10  \
&& swift run -c release storage-benchmark render results chart.png && open chart.png
```
