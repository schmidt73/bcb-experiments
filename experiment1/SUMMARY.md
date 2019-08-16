# Summary

The following table shows the number of significant clusters
output by PASCAL when running spectral clustering with k = N
clusters on the DSD graph of the network.

| network | k = 100  | k = 200  | k = 500  | k = 1000 |
|---------|----------|----------|----------|----------|
|    1    |    14    |    8     |    13    |    7     |
|    2    |    5     |    6     |    6     |    8     |
|    4    |    14    |    11    |    12    |    14    |
|    5    |    0     |    5     |    5     |    4     |
|    6    |    6     |    10    |    5     |    5     |

The following tables show the number of significant clusters
output by PASCAL when running spectral clustering with k = N
clusters on the DSD graph of the network and greedily merging with
genecentric clusters.

Positive genecentric clusters:

| network | k = 100  | k = 200  | k = 500  | k = 1000 |
|---------|----------|----------|----------|----------|
|    2    |    2     |    5     |    7     |    5     |
|    4    |    13    |    15    |    12    |    10    |
|    5    |    2     |    7     |    8     |    4     |
|    6    |    5     |    7     |    4     |    6     |

Negative genecentric clusters:

| network | k = 100  | k = 200  | k = 500  | k = 1000 |
|---------|----------|----------|----------|----------|
|    1    |    8     |    7     |    7     |    6     |
|    2    |    2     |    4     |    6     |    5     |
|    4    |    9     |    10    |    6     |    7     |
|    5    |    0     |    5     |    5     |    3     |
|    6    |    5     |    7     |    4     |    6     |

