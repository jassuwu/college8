# %%
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

from sklearn.preprocessing import LabelEncoder, StandardScaler
from imblearn.over_sampling import SMOTE
from sklearn.decomposition import PCA

# %%
df = pd.read_csv("UNSW_NB15_training-set.csv").set_index('id')
df

# %% [markdown]
# # Stage 1

# %%
# Data preprocessing

print("No. of cells missing data: ", df.isna().sum().sum() + df.isnull().sum().sum())
print("No. of duplicated rows: ", df.duplicated().sum())


# %% [markdown]
# There is no data missing.

# %%
# Drop the duplicates
df.drop_duplicates(inplace=True)
df.reset_index(inplace=True)

# Label the labellable cols and scale the rest
le = LabelEncoder()
scalable_cols = []
for col in df.columns:
    if col == 'label' or col == 'id' or df[col].dtype == np.dtype("O"):
        df[col] = le.fit_transform(df[col])
    else:
        scalable_cols.append(col)

df[scalable_cols] = pd.DataFrame(StandardScaler().fit_transform(df[scalable_cols]), columns=scalable_cols)
df.set_index('id', inplace=True)
df

# %%
# Feature Selection
corr_matrix = df.corr()
corr_with_target_feat = corr_matrix['label'].sort_values(ascending=False)
selected_features = corr_matrix[abs(corr_with_target_feat) > 0.5].index
selected_features

# %%
# Feature Analysis
plt.figure(figsize=(12, 8))
sns.heatmap(df.corr(), cmap='coolwarm')
plt.show()

# %% [markdown]
# ### Data Resampling
# When dealing with imbalanced datasets, Synthetic Minority Over-sampling Technique (SMOTE) is a popular approach. It works by creating synthetic samples from the minor class instead of creating copies, which helps overcome the overfitting problem.

# %%
# Generation of synthetic samples with SMOTE
X, y = df.drop('label', axis=1), df['label']
smote = SMOTE(random_state=42, k_neighbors=5)
X, y = smote.fit_resample(X, y)
df = pd.DataFrame(X, columns=X.columns)
df['label'] = y
print(df.label.value_counts())
df

# %% [markdown]
# ###  Feature Space Reduction
# After balancing the data, reducing the feature space is a good strategy to decrease computational complexity and potentially increase model accuracy. 
# 
# Techniques such as Principal Component Analysis (PCA), Linear Discriminant Analysis (LDA), or simply removing low-variance or highly-correlated features can be used.

# %%
# PCA
X, y = df.drop('label', axis=1), df['label']
pca = PCA(n_components=10).fit(X)
X = pca.transform(X)
df = pd.DataFrame(X, columns=[f'PC{i+1}' for i in range(X.shape[1])])
df['label'] = y
print(df.label.value_counts())
df

# %% [markdown]
# # Stage 2
# 
# Commented out because it takes a while, and we have the sample result down there.

# %%
from sklearn.ensemble import RandomForestClassifier, VotingClassifier, GradientBoostingClassifier, AdaBoostClassifier
# from sklearn.svm import SVC
# from sklearn.linear_model import LogisticRegression
# from sklearn.neighbors import KNeighborsClassifier
# from sklearn.tree import DecisionTreeClassifier
# from sklearn.model_selection import GridSearchCV

# X = df.drop('label', axis=1)
# y = df['label']

# # Define base models
# model1 = LogisticRegression()
# model2 = KNeighborsClassifier()
# model3 = SVC()
# model4 = DecisionTreeClassifier()
# model5 = RandomForestClassifier()
# model6 = AdaBoostClassifier()
# model7 = GradientBoostingClassifier()

# # Define ensemble model
# ensemble = VotingClassifier(estimators=[('lr', model1), ('knn', model2), ('svc', model3), ('dt', model4), ('rf', model5), ('ab', model6), ('gb', model7)], voting='hard')

# # Define hyperparameters to tune
# params = {
#     'lr__C': [1, 10], 
#     'rf__n_estimators': [10, 50], 
#     'svc__C': [1, 10], 
#     'knn__n_neighbors': [3, 5, 7], 
#     'dt__max_depth': [None, 5, 10],
#     'ab__n_estimators': [50, 100],
#     'gb__n_estimators': [50, 100],
#     'gb__learning_rate': [0.1, 0.01]
# }

# # Perform grid search
# grid = GridSearchCV(estimator=ensemble, param_grid=params, cv=5)
# grid.fit(X, y)

# # Print best parameters
# print(grid.best_params_)

# %%
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import cross_val_score

# X = df.drop('label', axis=1)
# y = df['label']

# # Define base models
# model1 = LogisticRegression()
# model2 = KNeighborsClassifier()
# model3 = SVC()
# model4 = DecisionTreeClassifier()
# # ... Add more models

# # List of models
# models = [model1, model2, model3, model4]

# # Dictionary to hold model names and their scores
# scores = {}

# # Evaluate each model
# for model in models:
#     model_name = type(model).__name__
#     print(model_name)
#     score = cross_val_score(model, X, y, cv=2, scoring='accuracy').mean()
#     scores[model_name] = score

# # Sort models based on score
# sorted_scores = sorted(scores.items(), key=lambda x: x[1], reverse=True)

# # Select top k models
# top_k = 4
# top_models = sorted_scores[:top_k]

# # Print top k models
# for i, (model_name, score) in enumerate(top_models):
#     print(f"Model {i+1}: {model_name}, Score: {score}")

# %% [markdown]
# In an example run:
# 
# - Model 1: KNeighborsClassifier, Score: `0.9687824529991047`
# - Model 2: DecisionTreeClassifier, Score: `0.9515846016114593`
# - Model 3: SVC, Score: `0.8483974932855864`
# - Model 4: LogisticRegression, Score: `0.8337332139659803`

# %% [markdown]
# Using unseen data instances to evaluate the effectiveness of the ensemble model. 👇

# %%
# Preprocessing of the testing instances

df_test = pd.read_csv('UNSW_NB15_testing-set.csv').set_index('id')
print("No. of cells missing data: ", df_test.isna().sum().sum() + df_test.isnull().sum().sum())
print("No. of duplicated rows: ", df_test.duplicated().sum())

df_test.drop_duplicates(inplace=True)
df_test.reset_index(inplace=True)

le = LabelEncoder()
scalable_cols = []
for col in df_test.columns:
    if col == 'label' or col == 'id' or df_test[col].dtype == np.dtype("O"):
        df_test[col] = le.fit_transform(df_test[col])
    else:
        scalable_cols.append(col)

df_test[scalable_cols] = pd.DataFrame(StandardScaler().fit_transform(df_test[scalable_cols]), columns=scalable_cols)
df_test.set_index('id', inplace=True)

# PCA
X_test, y_test = df_test.drop('label', axis=1), df_test['label']
X_test = pca.transform(X_test)
df_test = pd.DataFrame(X_test, columns=[f'PC{i+1}' for i in range(X_test.shape[1])])
df_test['label'] = y
print(df_test.label.value_counts())
df_test

# %%
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score
from sklearn.model_selection import train_test_split

X_train, y_train = X, df['label']
X_test, y_test = df_test.drop('label', axis=1), df_test['label']

# Consider Logistic Regression as some existing model
existing_model = LogisticRegression()
existing_model.fit(X_train, y_train)
existing_preds = existing_model.predict(X_test)

existing_accuracy = accuracy_score(y_test, existing_preds)
existing_precision = precision_score(y_test, existing_preds)
existing_recall = recall_score(y_test, existing_preds)
existing_f1 = f1_score(y_test, existing_preds)

print("\nExisting Model Performance:")
print("Accuracy:", existing_accuracy)
print("Precision:", existing_precision)
print("Recall:", existing_recall)
print("F1 Score:", existing_f1)

# %%
# Ensemble
model1 = LogisticRegression()
model2 = KNeighborsClassifier()
model3 = SVC()
model4 = DecisionTreeClassifier()
ensemble = VotingClassifier(estimators=[('lr', model1), ('knn', model2), ('svc', model3), ('dt', model4)], voting='hard')

ensemble.fit(X_train, y_train)
ensemble_preds = ensemble.predict(X_test)

ensemble_accuracy = accuracy_score(y_test, ensemble_preds)
ensemble_precision = precision_score(y_test, ensemble_preds)
ensemble_recall = recall_score(y_test, ensemble_preds)
ensemble_f1 = f1_score(y_test, ensemble_preds)

print("Ensemble Model Performance:")
print("Accuracy:", ensemble_accuracy)
print("Precision:", ensemble_precision)
print("Recall:", ensemble_recall)
print("F1 Score:", ensemble_f1)

# %%



