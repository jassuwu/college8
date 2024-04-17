# Chapter 2 - Data preprocessing

## Why Data Preprocessing?

Real-world data is often "dirty" and needs to be cleaned before it can be used effectively for data analysis or machine learning. Here are the three main types of "dirty" data:

1. **Incomplete Data**: This is when data lacks attribute values, certain attributes of interest, or only contains aggregate data. For example, a data record might have an empty field for "occupation".

2. **Noisy Data**: This is when data contains errors or outliers. For example, a data record might have a negative value for "salary", which doesn't make sense in real-world context.

3. **Inconsistent Data**: This is when data contains discrepancies in codes or names. For example, a data record might have an "age" of 42 but a "birthday" that indicates a different age. Another example is when a rating system changes, such as going from a numerical rating (1, 2, 3) to a letter rating (A, B, C).

## Why is data dirty?

- **Incomplete Data**: Can arise from:
  - "Not applicable" values during collection
  - Changes in considerations between data collection and analysis
  - Human, hardware, or software problems
- **Noisy Data**: Can be due to:
  - Faulty data collection instruments
  - Errors during data entry
  - Errors in data transmission
- **Inconsistent Data**: Can result from:
  - Different data sources
  - Violation of functional dependencies (e.g., modifying linked data)
  - Duplicate records

## Why is data preprocessing important?

1. **Quality Data for Quality Mining**: Without quality data, mining results will be of poor quality.

   - **Quality Decisions**: Decisions should be based on quality data.

     - For e.g., duplicate or missing data can lead to incorrect or misleading statistics.

   - **Data Warehouse**: A data warehouse requires the consistent integration of quality data.

2. **Data Preprocessing**: The majority of the work in building a data warehouse involves data extraction, cleaning, and transformation. This step ensures the data is of high quality before it is used for mining.

**A well accepted multidimensional view:**

- Accuracy
- Completeness
- Consistency
- Timeliness
- Believability
- Value added
- Interpretability
- Accessibility

## Data Preprocessing Tasks

1. **Data Cleaning**:

   - Fill in missing values
   - Smooth noisy data
   - Identify or remove outliers
   - Resolve inconsistencies

2. **Data Integration**:

   - Combine multiple databases, data cubes, or files

3. **Data Transformation**:

   - Normalize and aggregate data

4. **Data Reduction**:

   - Reduce data volume but maintain similar analytical results

5. **Data Discretization**:
   - Part of data reduction with particular importance for numerical data

## Graphic Displays of Basic Statistical Descriptions

1. **Histogram**: A graphical representation of the distribution of a dataset.
2. **Boxplot**: A standardized way of displaying the dataset based on a five-number summary: minimum, first quartile, median, third quartile, and maximum.
3. **Quantile Plot**: Each value `xi` is paired with `fi` indicating that approximately `100*fi%` of data are less than or equal to `xi`.
4. **Quantile-Quantile (Q-Q) Plot**: Graphs the quantiles of one univariate distribution against the corresponding quantiles of another.
5. **Scatter Plot**: Each pair of values is a pair of coordinates and plotted as points in the plane.
6. **Loess (Local Regression) Curve**: Adds a smooth curve to a scatter plot to provide better perception of the pattern of dependence.

## Data Cleaning

### Importance

- Data cleaning is one of the biggest problems in data warehousing.
- Tasks include filling in missing values, identifying outliers, smoothing out noisy data, correcting inconsistent data, and resolving redundancy caused by data integration.

### Handling Missing Data

- Data may not always be available due to various reasons such as equipment malfunction, inconsistency with other recorded data, data not entered due to misunderstanding, etc.
- Missing data may need to be inferred.
- Methods to handle missing data include ignoring the tuple, filling in the missing value manually, or automatically with a global constant, the attribute mean, the attribute mean for all samples belonging to the same class, or the most probable value.

### Handling Noisy Data

- Noise is a random error or variance in a measured variable.
- Incorrect attribute values may be due to faulty data collection instruments, data entry problems, data transmission problems, technology limitation, inconsistency in naming convention, etc.
- Methods to handle noisy data include binning, regression, clustering, and combined computer and human inspection.

### Binning for Data Smoothing

- Binning methods include equal-width (distance) partitioning and equal-depth (frequency) partitioning.
- After partitioning the data into bins, the data can be smoothed by bin means, bin median, or bin boundaries.

### Data Cleaning as a Process

- Data discrepancy detection involves using metadata (e.g., domain, range, dependency, distribution), checking uniqueness rule, consecutive rule and null rule, and using commercial tools.
- Data scrubbing uses simple domain knowledge to detect errors and make corrections.
- Data auditing involves analyzing data to discover rules and relationships to detect violators.
