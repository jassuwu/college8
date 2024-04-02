[Link to slides](https://docs.google.com/presentation/d/1mq-QJ65FhsE4y536Z6dQkttSg4dVPnPc/edit#slide=id.p1)

# AdaBoost (Adaptive Boosting)

AdaBoost is a popular boosting algorithm used to improve the accuracy of a learning method. Here's how it works:

1. **Initial Dataset**: We start with a dataset 'D' consisting of 'd' tuples, each labeled with a class. Each tuple is represented as (Xi, yi), where Xi is the tuple and yi is its class label.

2. **Initial Weights**: AdaBoost begins by assigning each training tuple an equal weight of 1/d.

3. **Generating Classifiers**: The algorithm proceeds in 'k' rounds to generate 'k' classifiers for the ensemble. In each round:

   - **Selection Based on Weights**: Each tuple's chance of being selected for training the classifier is based on its weight. A classifier model, Mi, is derived from the training tuples of Di.

   - **Error Calculation**: The error of Mi is calculated using Di as a test set.

   - **Weight Adjustment**: The weights of the training tuples are then adjusted based on how they were classified. If a tuple was incorrectly classified, its weight is increased. If a tuple was correctly classified, its weight is decreased.

   - **Difficulty of Classification**: A tuple's weight reflects how difficult it is to classify. The higher the weight, the more often it has been misclassified. These weights will be used to generate the training samples for the classifier of the next round.

Some classifiers may be better at classifying some "difficult" tuples than others. By focusing more on the instances that previous classifiers got wrong, AdaBoost can create a strong learner that performs well on a wide range of instances.

# Example problem in slides
