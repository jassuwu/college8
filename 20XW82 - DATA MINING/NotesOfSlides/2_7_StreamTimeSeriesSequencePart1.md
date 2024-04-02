[Link to slides](https://docs.google.com/presentation/d/1RfPpYcO8g-cZqXRtHU5jEZOUHSKKRQKa/edit#slide=id.p1)

> This is a biggie. 😮‍💨

# Characteristics of Data Streams

## Data Streams

Data streams are a continuous flow of data that is ordered and rapidly changing. They are characterized by their immense volume and speed. Unlike traditional Database Management Systems (DBMS) where data is stored in finite, static datasets, data streams are potentially infinite.

## Key Characteristics

### Volume and Speed

Data streams can have enormous volumes of continuous data that could be potentially infinite. They are fast-changing and require quick, real-time responses.

### Capturing Data Processing Needs

Data streams effectively capture our current data processing needs. They are particularly useful in today's fast-paced, data-driven world.

### Single Scan Algorithm

Random access in data streams is costly. Therefore, a single scan algorithm is used, which means the data can only be viewed once.

### Data Summary

Only the summary of the data seen so far is stored due to the continuous and voluminous nature of data streams.

### Multi-level and Multi-dimensional Processing

Most stream data are either at a pretty low-level or multi-dimensional in nature. This necessitates processing that is both multi-level and multi-dimensional.

# Applications of Stream Data

# Architecture: Stream Query Processing

# Challenges of Stream Data Processing

### Multiple, Continuous, and Rapid Streams

Stream data processing involves handling multiple streams that are continuous, rapid, time-varying, and ordered. This presents a unique set of challenges due to the dynamic nature of the data.

### Main Memory Computations

The computations in stream data processing are often performed in main memory, which requires efficient memory management techniques.

### Continuous Queries

Queries in stream data processing are often continuous. They are evaluated continuously as new stream data arrives, and the answer is updated over time.

### Complex Queries

The queries involved in stream data processing are often complex. They go beyond simple element-at-a-time or stream-at-a-time processing. They also extend beyond traditional relational queries and may involve scientific computations, data mining, and Online Analytical Processing (OLAP).

### Multi-level and Multi-dimensional Processing

Stream data processing often requires multi-level and multi-dimensional processing. This is because most stream data are either at a low level or multi-dimensional in nature. This necessitates sophisticated data mining techniques to extract meaningful information from the data.

# Processing Stream Queries

### Types of Queries

Stream queries can be categorized into two types:

1. **One-time queries** vs. **Continuous queries**: Continuous queries are evaluated continuously as the stream data arrives, unlike one-time queries which are evaluated once.

2. **Predefined queries** vs. **Ad-hoc queries**: Predefined queries are set in advance, while ad-hoc queries are issued on-the-fly.

### Memory Requirements

Stream data processing often requires real-time responses, which necessitates the use of main memory algorithms. However, the memory requirement can become unbounded if one needs to join future tuples.

### Approximate Query Answering

Due to the bounded memory, it is not always possible to produce exact answers. Therefore, high-quality approximate answers are often desired in stream data processing.

### Data Reduction and Synopsis Construction Methods

Various methods are used for data reduction and synopsis construction in stream data processing. These include sketches, random sampling, histograms, wavelets, etc. These techniques help in managing the large volume of data and in extracting meaningful information from the data streams.

# Methodologies for Stream Data Processing

### Major Challenges

One of the significant challenges in stream data processing is tracking a large universe of data. For instance, keeping track of pairs of IP addresses rather than simple data like ages.

### Methodology

The methodology for stream data processing often involves the use of synopses. This approach involves a trade-off between accuracy and storage.

- **Synopsis Data Structure**:
  A synopsis data structure is used, which is much smaller (O(log<sup>k</sup> N) space) than their base data set (O(N) space). This helps in managing the large volume of data.

- **Approximate Answer**:
  An approximate answer is computed within a small error range (factor ε of the actual answer). This is due to the continuous and voluminous nature of data streams, which makes exact computation challenging.

### Major Methods

Several methods are used in stream data processing. These include:

1. **Random Sampling**: This involves selecting a random subset of data from the stream for processing.

2. **Histograms**: These are graphical representations that organize a group of data points into a specified range.

3. **Sliding Windows**: This technique involves processing the most recent data items in the stream.

4. **Multi-resolution Model**: This model processes data at different levels of granularity.

5. **Sketches**: These are summary representations of the data stream.

6. **Randomized Algorithms**: These algorithms use a random number at least once during the computation to provide an approximate solution.

# Approximate Query Answering in Streams

### Sliding Windows

Queries are often executed over sliding windows of recent stream data. While this approach provides an approximation, it is often more desirable in applications due to its ability to focus on the most relevant data.

### Batched Processing, Sampling, and Synopses

- **Batched Processing**: This method is used when data updates are fast but computations are slow. The computation is performed periodically, which may not always provide the most timely results.
- **Sampling**: This method is used when data updates are slow but computations are fast. Computations are performed using sample data. However, this method may not be suitable for operations such as joins.
- **Synopses**: Synopsis data structures maintain a small synopsis or sketch of the data, which is useful for querying historical data.

### Blocking Operators

Blocking operators like sorting, average, minimum, etc., are unable to produce the first output until they have seen the entire input. This can be a challenge in stream data processing where data is continuously arriving.

# Stream Data Mining vs. Stream Querying

### Stream Data Mining

Stream data mining is often a more challenging task compared to stream querying. It shares many of the difficulties associated with stream querying, but often requires less precision. For example, operations like join, grouping, and sorting are not typically required in stream data mining.

The patterns in stream data mining are hidden and more general than those in querying. It may require exploratory analysis and the queries are not necessarily continuous.

### Stream Data Mining Tasks

Stream data mining involves several tasks:

1. **Multi-dimensional Online Analysis of Streams**: This involves analyzing the stream data across multiple dimensions in real-time.

2. **Mining Outliers and Unusual Patterns in Stream Data**: This task involves identifying data points or patterns that deviate significantly from the rest of the data.

3. **Clustering Data Streams**: This involves grouping similar data points together based on certain criteria.

4. **Classification of Stream Data**: This involves assigning predefined labels to the data points based on their characteristics.

# Examples of Multi-Dimensional Stream Analysis

## Web Click Stream Analysis

Web click streams provide raw data at low levels, such as timestamps in seconds, web page addresses, and user IP addresses. Analysts are interested in identifying changes, trends, and unusual patterns at reasonable levels of detail. For instance, an analyst might observe that the average clicking traffic on sports-related content in North America has increased by 40% in the last 15 minutes compared to the last 24 hours.

## Power Consumption Stream Analysis

Power consumption streams provide raw data on the power consumption flow for every household, every minute. Analysts can find patterns in this data. For example, the average hourly power consumption for manufacturing companies in Chicago may surge up by 30% in the last 2 hours today compared to the same day a week ago.

# Tilted Time Model

# Frequent Patterns in Stream Data

Frequent pattern mining is a valuable technique in stream data applications. For instance, it's used in network intrusion mining. However, mining precise frequent patterns in stream data is often unrealistic, even when storing them in a compressed form such as an FP-tree.

### Approximate Frequent Patterns

To mine frequent patterns with a good approximation, one approach is to use approximate frequent patterns. However, if we only keep the current frequent patterns, we won't be able to detect any changes.

### Mining Evolution of Frequent Patterns

Another approach is to mine the evolution of frequent patterns. This involves using a tilted time window frame to track changes over different time scales.

### Mining Dramatic Changes

This methodology can also be used to mine dramatic changes in frequent patterns, providing insights into significant shifts in the data.

### Space-Saving Computation

Space-saving computation of frequent and top-k elements is another technique used in stream data mining. This method is efficient in terms of memory usage, making it suitable for large-scale data streams.

# Approximation Guarantee

Given the following parameters:

1. Support threshold (σ)
2. Error threshold (ε)
3. Stream length (N)

The output will be items with frequency counts exceeding $(σ - ε)N$.

### Undercounting

If the stream length seen so far is $N$ and the bucket size is $1/ε$, then the frequency count error is less than or equal to the number of buckets, which is $εN$.

### Approximation Guarantee

- There are no false negatives.
- False positives have a true frequency count of at least $(σ - ε)N$.
- The frequency count is underestimated by at most $εN$. This means that the actual frequency count could be higher, but the error will not exceed $εN$.

# Mining Evolution of Frequent Patterns in Stream Data

### Approximate Frequent Patterns

The concept of approximate frequent patterns was introduced by Manku and Motwani. This method involves keeping only the current frequent patterns. However, a limitation of this approach is that it does not allow for the detection of changes over time.

### Mining Evolution and Dramatic Changes

Giannella, Han, Yan, and Yu proposed a method for mining the evolution and dramatic changes of frequent patterns. This approach uses a tilted time window frame to track changes over different time scales.

### Storing Significant Patterns

In this method, a compressed form is used to store significant (approximate) frequent patterns and their time-dependent traces. This allows for efficient storage and retrieval of patterns.

### Precise Counts

To mine precise counts, one has to trace or keep a fixed (and small) set of items. This ensures that the most relevant items are always available for analysis.

# Two Structures for Mining Frequent Patterns with Tilted-Time Window

### FP-Trees

FP-Trees are used to store frequent patterns rather than individual transactions. In the context of a tilted-time window, an FP-tree is created for each time frame. This structure is referred to as the **tilted-time major**.

### Pattern-Tree Major

The second data structure used in mining frequent patterns with a tilted-time window is the **pattern-tree major**. This structure is based on the observation that FP-Trees of different time units are similar. In the pattern-tree major, each node is associated with a tilted-time window. This allows for efficient tracking and analysis of patterns over different time scales.

These two structures provide a comprehensive framework for mining frequent patterns in stream data, taking into account the temporal dynamics of the data. They allow for efficient storage and retrieval of patterns, making them suitable for large-scale data streams.

# CluStream: Clustering Online Streams

CluStream is a method for clustering online streams. It involves two main processes: online micro-cluster maintenance and query-based macro-clustering.

### Online Micro-Cluster Maintenance

This process involves the following steps:

1. **Initial Creation**: Initially, `q` micro-clusters are created, where `q` is usually significantly larger than the number of natural clusters. This allows for a more granular representation of the data.

2. **Online Incremental Update**: As new data points arrive, they are incrementally added to the micro-clusters. If a new point is within the maximum boundary of a micro-cluster, it is inserted into that micro-cluster. Otherwise, a new cluster is created.

3. **Deletion and Merging**: Over time, obsolete micro-clusters may be deleted or the two closest ones may be merged. This helps in maintaining the relevance and accuracy of the clusters.

### Query-Based Macro-Clustering

This process is based on a user-specified time-horizon `h` and the number of macro-clusters `K`. Macro-clusters are computed using the k-means algorithm, which groups the data into `K` clusters such that the within-cluster sum of squares is minimized.

Through these processes, CluStream provides an effective way to cluster online streams, allowing for real-time analysis and understanding of the data.

...and more.
