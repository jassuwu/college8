# Hierarchical Clustering Approaches and BIRCH

1. **Agglomerative Approach**: This approach is relatively straightforward to implement. It involves continuously merging clusters (or nodes) that have the smallest distance between them in each iteration, resulting in larger clusters. This process continues until all data points are part of a single cluster or until a stopping criterion is met.
2. **Divisive Approach**: Implementing this approach can be challenging due to two main issues. First, deciding on a splitting criterion that determines how to divide a cluster is not straightforward. Second, given a set of clusters at a particular level in the tree, it can be difficult to decide which cluster to split next.
3. **Balanced Iterative Reducing and Clustering using Hierarchies (BIRCH)**: BIRCH is a clustering algorithm designed to handle large datasets. It first generates a small and compact summary of the large dataset that retains as much information as possible. This summary is then used to create the clusters, making BIRCH an efficient and effective option for large-scale clustering tasks.

# CF Tree

## CF Tree Construction

1. **Phase 1 - Building the CF Tree**: Objects are dynamically inserted to build the Clustering Feature (CF) tree. An object is inserted into the closest leaf entry. If the diameter of the sub-cluster stored at the leaf node, after insertion, exceeds the specified threshold ‘T’, the leaf node is split. After successful insertion of the current object, the information about the inserted object is passed towards the root of the tree. If the memory required to store the CF tree exceeds the available memory, the diameter threshold ‘T’ is updated (increased) and the tree is rebuilt.
2. **Phase 2 - Obtaining Final Clusters**: Once the CF tree is built, any clustering method, such as a partitioning method, can be used with the CF tree to obtain the final clusters.
3. **Advantages and Disadvantages**: The most significant advantage of this algorithm is its time complexity, which is O(n), where ‘n’ is the number of objects. This makes it highly efficient. However, a disadvantage is that it works well only for clusters that are spherical in shape and for numeric attributes.

Look at slides for the example construction of a CF Tree. **(No. Don't. Look elsewhere.)**

Look here:
https://medium.com/@vipulddalal/birch-algorithm-with-working-example-a7b8fe047bd4
