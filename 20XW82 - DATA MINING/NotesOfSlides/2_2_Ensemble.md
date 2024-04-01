[Link to slides](https://docs.google.com/presentation/d/1fTrZlWOLIydCAPqslB08xBKwb8emoFF4/edit#slide=id.p16)

Pg. 16

# Bagging Process

1. **Initial Dataset**: Start with an initial training dataset that contains 'n' instances.

2. **Create Subsets**: Generate 'm' subsets of data from the initial training set.

3. **Sampling for subsets**: For each subset, draw a sample of 'N' data points from the initial dataset. This sampling is done with replacement, which means a specific data point can appear more than once in a subset.

4. **Train Models**: Train a model (also known as a weak learner) on each subset. These models are homogeneous, meaning they are all of the same type.

5. **Make Predictions**: Each model independently makes predictions based on its training.

6. **Aggregate Predictions**: The predictions from all models are then combined into a single prediction. This is done using either a majority vote (for classification problems) or averaging (for regression problems).

This process allows the model to capture a wider range of patterns in the data by training on different subsets, and reduces the risk of overfitting by averaging the predictions. It's a powerful technique used in ensemble learning to improve model performance.

# Issues in Ensemble Methods

> Not sure how some of these are issues. 💀

1. **Parallelism**: Bagging can be easily parallelized because each model is built independently. However, Boosting cannot be parallelized as easily because each model is built sequentially, learning from the mistakes of the previous models.

2. **Handling Noisy Data**: There are different versions of Boosting designed to handle noisy data. These variants modify the original Boosting algorithm to be more robust against noise.

3. **Strength of Base-Learners**: One of the questions in Boosting is how "weak" a base-learner should be. The base-learner should be just complex enough to capture the necessary patterns in the data, but not so complex that it overfits the training data.

4. **Boosting and Generalization**: The theoretical explanation of Boosting's ability to improve generalization is complex. In simple terms, Boosting improves generalization by combining many weak learners, each of which may only be slightly better than random guessing, into a single strong learner that can make accurate predictions.

5. **Diversity and Generalization Performance**: The diversity of ensembles significantly affects their generalization performance. If the models in the ensemble make very different errors, they can "cover" for each other's mistakes, leading to better overall performance.

6. **Combining Boosting and Bagging**: Combining Boosting and Bagging is an area of ongoing research. The idea is to leverage the strengths of both methods to create even more powerful ensemble models.

# Random Forests

Random Forests is an ensemble learning method that operates by constructing multiple decision trees at training time and outputting the class that is the mode of the classes (classification) or mean prediction (regression) of the individual trees.

Here's how we obtain slightly different trees from a single dataset:

1. **Bagging (Bootstrap Aggregating)**:

   - Start with your original dataset.
   - Create 'N' smaller datasets by taking random subsets of data points from the original dataset. This is done with replacement, meaning a specific data point can appear more than once in a subset.
   - Fit a decision tree on each of these subsets. Each tree will be slightly different because it's been trained on a different subset of the original data.

2. **Random Subspace Method (also known as Feature Bagging)**:
   - Instead of using all features to split each node when building the tree, Random Forests randomly selects a subset of features at each split.
   - This introduces further diversity into the model and makes it more robust to noise and overfitting.

By combining the predictions of multiple slightly different trees, Random Forests can often achieve better performance than any of its individual trees could.

# Boosting Process

1. **Sampling Subsets**: Start with an initial training dataset. From this dataset, create 'm' subsets by sampling randomly.

2. **Training the First Learner**: Use the first subset to train the initial weak learner (a model that is slightly better than random guessing).

3. **Testing the Learner**: Test the trained weak learner using the same subset of training data. Some data points will be predicted correctly, while others will not.

4. **Updating the Subset**: For each data point that was incorrectly predicted by the first learner, increase its weight in the second subset. This process of updating ensures that the next learner pays more attention to the instances that the previous learner got wrong.

5. **Training Subsequent Learners**: Use this updated subset to train the next weak learner. Test this learner and update the weights of the incorrectly predicted instances for the next subset.

6. **Iterating the Process**: Continue this process of training learners, testing them, and updating the subsets for each subsequent learner until all 'm' subsets have been used.

7. **Aggregating Predictions**: The final prediction is made by aggregating the predictions of all the weak learners. This aggregation is done at each step when a new learner is added, so there's no need to calculate it at the end.

By focusing more on the instances that previous learners got wrong, Boosting can create a strong learner that performs well on a wide range of instances.

# Summary

**Ensemble Learning** methods leverage multiple learning algorithms to achieve better performance than any of the individual algorithms could on their own.

Commonly-used ensemble methods include:

1. **Bagging**: This method involves training multiple models on random subsets of data samples. Each model is trained independently and their predictions are combined, often by voting or averaging.

2. **Random Subspace Method (also known as Feature Bagging)**: This method involves training multiple models, each on a random subset of features. This introduces more diversity into the model and makes it more robust.

3. **Boosting**: This method involves training models iteratively. Each model is trained to focus on the mistakes of the previous ones by increasing the weight of misclassified samples. This results in each new model being a specialist in correcting the mistakes of its predecessors.

**Random Forests** are a popular ensemble learning method that employs decision tree learning. They build multiple decision trees through both bagging and the random subspace method. One of the key advantages of Random Forests is their ability to rectify the overfitting problem often seen with individual decision trees, making them a powerful tool in machine learning.
