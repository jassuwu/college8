[Link to slides](https://docs.google.com/presentation/d/17xcdZAR0Ek6-w1mfJDl6NXgq0CxmcYV4/edit#slide=id.p1) 

# Agglomerative Hierarchical Clustering
**Agglomerative Hierarchical Clustering** is a method of cluster analysis which seeks to build a hierarchy of clusters. The process can be summarized as follows:

1. **Distance Calculation**: The process begins by calculating the distance between every pair of units that we want to cluster. This forms a distance matrix.

2. **Matrix Properties**: This matrix is symmetric, meaning the distance from x to y is the same as the distance from y to x. The diagonal of the matrix is filled with zeroes, as every item is at zero distance from itself.

3. **Matrix Representation**: Only the lower triangle of the matrix is shown, as the upper triangle is a mirror image of the lower one.

4. **Cluster Formation**: The smallest distance in the matrix indicates the most similar pair of units. These units are then linked or merged first into a cluster. For example, if the smallest distance is between units three and five, they form the cluster '35'.

5. **Furthur Iterations**: This process continues iteratively, merging the closest pair of clusters at each step, until all units are in one cluster. This is known as **Complete Linkage Clustering**. The result is a tree-like diagram called a dendrogram, representing the nested grouping of units and similarity levels at which groupings change.
