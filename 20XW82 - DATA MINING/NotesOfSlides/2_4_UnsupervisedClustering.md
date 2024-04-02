[Link to slides](https://docs.google.com/presentation/d/1enhusM62OlNnKLhvGPhoxYZ2y5_93V3c/edit?usp=drive_link&ouid=111231193731952555201&rtpof=true&sd=true)

# Supervised Learning vs Unsupervised Learning

- **Supervised Learning**: This is a type of machine learning where we have a dataset with input attributes and a target attribute (also known as the class label). The goal of supervised learning is to discover patterns in the data that connect the input attributes with the target attribute. Once these patterns are learned, they can be used to predict the target attribute for new, unseen instances.

- **Unsupervised Learning**: In contrast to supervised learning, unsupervised learning deals with datasets that do not have a target attribute. The aim here is not to make predictions, but rather to explore the data to uncover intrinsic structures within them. This could mean identifying clusters of similar instances, finding unusual instances (outliers), or discovering more compact representations of the data.

# Clustering

Clustering is a method used to identify groups of similar items in data, which are referred to as clusters. The key idea is to group data instances that are close (similar) to each other into one cluster, and data instances that are far apart (dissimilar) from each other into different clusters.

Clustering is often categorized as an unsupervised learning task. This is because, unlike supervised learning, we don't have any pre-defined class labels denoting a grouping of the data instances. The algorithm discovers the inherent groupings within the data on its own.

Historically, clustering has been considered synonymous with unsupervised learning. However, it's important to note that there are other unsupervised learning tasks as well, such as association rule mining.

# Aspects of Clustering

1. **Clustering Algorithm**: This is the method used to create the clusters. There are many different clustering algorithms, each with its own strengths and weaknesses.
   - Partitional Clustering: This type of clustering divides data into non-overlapping groups (or clusters) without any structure or order between these groups. Examples of partitional clustering algorithms include K-means, K-medoids and DBSCAN.
   - Hierarchical Clustering: This type of clustering creates a hierarchy of clusters. It can be visualized as a tree-like diagram called a dendrogram. The root of the tree is the single cluster that gathers all the samples, the leaves being the clusters with only one sample.
2. **Distance Function**: This is a measure of the similarity or dissimilarity between data instances. Common distance measures include Euclidean distance, Manhattan distance, and cosine similarity.
3. **Clustering Quality**: The quality of a clustering result is typically evaluated mainly based on two criteria:
   - Inter-cluster Distance: The distance between different clusters. Ideally, this should be maximized, meaning that the clusters are well separated from each other.
   - Intra-cluster Distance: The distance between instances within the same cluster. Ideally, this should be minimized, meaning that instances within the same cluster are similar to each other.
4. **Other Factors**: The quality of a clustering result also depends on the choice of the algorithm, the distance function used, and the specific application or domain.

# Types of Clustering

1. **Exclusive Clustering**: K-means
2. **Overlapping Clustering**: Fuzzy C-means
3. **Hierarchical Clustering**: Agglomerative clustering, divisive clustering
4. **Probabilistic Clustering**: Mixture of Gaussian models

# Weaknesses of K-Means

1. **Mean Dependency**: K-means is only applicable if the mean of a dataset is defined. It may not work well with categorical data because the concept of a mean is not applicable to categories.

   - **Categorical Data**: For categorical data, a variant of k-means called k-modes is used where the centroid is represented by the most frequent values (modes) instead of the mean.

2. **Choice of K**: The user needs to specify the number of clusters (k), which is not always easy to determine. Choosing an inappropriate value of k can lead to poor clustering results.
3. **Sensitivity to Outliers**: K-means is sensitive to outliers, which are data points that are very far away from other data points. These outliers could be errors in the data recording or some special data points with very different values. The presence of outliers can distort the position of the centroid and lead to suboptimal clusters.

# Weaknesses of K-Means and Dealing with Outliers

1. **Outlier Removal**: One approach to deal with outliers in k-means is to remove data points that are much further away from the centroids than other data points. To ensure safety, these potential outliers could be monitored over several iterations before deciding to remove them.
2. **Random Sampling**: Another method is to perform random sampling. Since only a small subset of data points is chosen in sampling, the likelihood of selecting an outlier is very small. The remaining data points can then be assigned to the clusters based on distance or similarity comparison, or classification.
3. **Sensitivity to Initial Seeds**: The k-means algorithm is sensitive to the initial seeds (starting points). Different initial seeds can lead to different clusters.
4. **Cluster Shape**: The k-means algorithm may not be suitable for discovering clusters that are not hyper-ellipsoids (or hyper-spheres).

# K-Means Summary

Despite its weaknesses, k-means remains the most popular clustering algorithm due to its simplicity and efficiency. Other clustering algorithms have their own sets of weaknesses, and there is no clear evidence that any other clustering algorithm performs better in general, although they may be more suitable for certain types of data or applications. Comparing different clustering algorithms is a challenging task, as the correct clusters are often unknown.

# Ground Truth Evaluation

Ground truth evaluation is commonly used to compare different clustering algorithms. In real-life scenarios, a dataset for clustering usually doesn't come with class labels. Therefore, even if an algorithm performs exceptionally well on some labeled datasets, there's no guarantee that it will perform equally well on the actual application data at hand.

However, if an algorithm does perform well on several labeled datasets, it does provide us with some level of confidence in the quality of the algorithm. This method of evaluation, which relies on external data or information, is often referred to as **ground truth evaluation**.

# Evaluation Based on Internal Information

- **Intra-cluster Cohesion (Compactness)**: Cohesion measures the closeness of the data points in a cluster to the cluster centroid. The Sum of Squared Error (SSE) is a commonly used measure for this. The lower the SSE, the better the cohesion, as it indicates that the data points are close to their respective cluster centroids.
- **Inter-cluster Separation (Isolation)**: Separation refers to how far apart different cluster centroids are from one another. A good clustering result will have high separation, meaning that the clusters are well isolated from each other.

Despite these measures, in most applications, expert judgments are still crucial in evaluating the quality of the clustering results. This is because these measures are based on mathematical criteria, and may not always align with the intuitive or practical understanding of what constitutes a good cluster in a specific application context.
