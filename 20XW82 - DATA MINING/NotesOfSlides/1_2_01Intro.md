# 01Intro

## Why Data Mining?

- **Explosive Growth of Data**: Data has grown from terabytes to petabytes due to automated data collection tools, database systems, the Web, and a computerized society.
- **Major Sources of Abundant Data**: Business (Web, e-commerce, transactions, stocks), Science (Remote sensing, bioinformatics, scientific simulation), and Society (news, digital cameras, YouTube).
- **Need for Knowledge**: We are drowning in _data_, but starving for _knowledge_. Hence, the necessity for data mining - automated analysis of massive data sets.

## Evolution of Sciences

1. **Before 1600**: Empirical science
2. **1600-1950s**: Theoretical science. Each discipline grew a theoretical component. Theoretical models often motivate experiments and generalize our understanding.
3. **1950s-1990s**: Computational science. Most disciplines grew a third, computational branch. Computational Science traditionally meant simulation.
4. **1990-now**: Data science. The flood of data from new scientific instruments and simulations, the ability to economically store and manage petabytes of data online, and the Internet and computing Grid that makes all these archives universally accessible have led to the rise of data science.

## Evolution of Database Technology

1. **1960s**: Data collection, database creation, IMS and network DBMS
2. **1970s**: Relational data model, relational DBMS implementation
3. **1980s**: RDBMS, advanced data models (extended-relational, OO, deductive, etc.), application-oriented DBMS (spatial, scientific, engineering, etc.)
4. **1990s**: Data mining, data warehousing, multimedia databases, and Web databases
5. **2000s**: Stream data management and mining, data mining and its applications, Web technology (XML, data integration) and global information systems

## What is Data Mining?

- **Data Mining**: Extraction of interesting (non-trivial, implicit, previously unknown and potentially useful) patterns or knowledge from a huge amount of data.
- **Alternative Names**: Knowledge discovery (mining) in databases (KDD), knowledge extraction, data/pattern analysis, data archeology, data dredging, information harvesting, business intelligence, etc.
- **Note**: Not everything is "data mining". Simple search and query processing, as well as (deductive) expert systems, are not considered data mining.

## Knowledge Discovery (KDD) Process

- **Input Data**: The raw data to be processed.
- **Data Pre-Processing**: Includes data integration, normalization, feature selection, and dimension reduction.
- **Pattern Discovery**: Includes association & correlation, classification, clustering, outlier analysis, etc.
- **Post-Processing**: Includes pattern evaluation, pattern selection, pattern interpretation, and pattern visualization.

This is a view from typical machine learning and statistics communities.

## Example: Medical Data Mining

- **Health Care & Medical Data Mining**: Often adopts such a view in statistics and machine learning.
- **Preprocessing of the Data**: Includes feature extraction and dimension reduction.
- **Classification or/and Clustering Processes**: The main data mining processes.
- **Post-processing for Presentation**: The final step to present the data mining results.

## Multi-Dimensional View of Data Mining

### Data to be Mined

- Database data (extended-relational, object-oriented, heterogeneous, legacy), data warehouse, transactional data, stream, spatiotemporal, time-series, sequence, text and web, multi-media, graphs & social and information networks.

### Knowledge to be Mined (Data Mining Functions)

- Characterization, discrimination, association, classification, clustering, trend/deviation, outlier analysis, etc.
- Descriptive vs. predictive data mining.
- Multiple/integrated functions and mining at multiple levels.

### Techniques Utilized

- Data-intensive, data warehouse (OLAP), machine learning, statistics, pattern recognition, visualization, high-performance, etc.

### Applications Adapted

- Retail, telecommunication, banking, fraud analysis, bio-data mining, stock market analysis, text mining, Web mining, etc.

## Data Mining: On What Kinds of Data?

### Database-oriented Data Sets and Applications

- Relational database
- Data warehouse
- Transactional database

### Advanced Data Sets and Advanced Applications

- Data streams and sensor data
- Time-series data, temporal data, sequence data (including bio-sequences)
- Structure data, graphs, social networks and multi-linked data
- Object-relational databases
- Heterogeneous databases and legacy databases
- Spatial data and spatiotemporal data
- Multimedia database
- Text databases
- The World-Wide Web

## What Kinds of Patterns Can Be Mined?

### Data Mining Function: (1) Generalization

- Information integration and data warehouse construction
- Data cleaning, transformation, integration, and multidimensional data model
- Data cube technology and OLAP (online analytical processing)
- Multidimensional concept description: Characterization and discrimination

### Data Mining Function: (2) Association and Correlation Analysis

- Frequent patterns (or frequent itemsets)
- Association, correlation vs. causality
- Typical association rule: Diaper 🡪 Beer [50%, 75%] (support, confidence)

### Data Mining Function: (3) Classification

- Classification and label prediction
- Typical methods: Decision trees, naïve Bayesian classification, support vector machines, neural networks, rule-based classification, pattern-based classification, logistic regression
- Typical applications: Credit card fraud detection, direct marketing, classifying stars, diseases, web-pages

### Data Mining Function: (4) Cluster Analysis

- Unsupervised learning (i.e., Class label is unknown)
- Group data to form new categories (i.e., clusters)

### Data Mining Function: (5) Outlier Analysis

- Outlier: A data object that does not comply with the general behavior of the data
- Useful in fraud detection, rare events analysis

### Time and Ordering: Sequential Pattern, Trend and Evolution Analysis

- Sequence, trend and evolution analysis
- Trend, time-series, and deviation analysis
- Sequential pattern mining
- Periodicity analysis
- Motifs and biological sequence analysis
- Mining data streams

### Structure and Network Analysis

- Graph mining
- Information network analysis
- Social networks: actors (objects, nodes) and relationships (edges)
- Web mining: Analysis of Web information networks

### Evaluation of Knowledge

- Are all mined knowledge interesting?
- Evaluation of mined knowledge → directly mine only interesting knowledge?
- Descriptive vs. predictive
- Coverage
- Typicality vs. novelty
- Accuracy
- Timeliness

## Data Mining: Confluence of Multiple Disciplines

Data Mining is a field that combines multiple disciplines including:

- Applications
- Algorithm
- Database Technology
- High-Performance Computing
- Machine Learning
- Pattern Recognition
- Statistics
- Visualization

## Why Confluence of Multiple Disciplines?

The need for a multi-disciplinary approach in Data Mining arises due to:

- **Tremendous Amount of Data**: Algorithms must be highly scalable to handle terabytes of data.
- **High-Dimensionality of Data**: For example, a micro-array may have tens of thousands of dimensions.
- **High Complexity of Data**: This includes data streams, sensor data, time-series data, temporal data, sequence data, structure data, graphs, social networks, multi-linked data, heterogeneous databases, legacy databases, spatial, spatiotemporal, multimedia, text and Web data, and software programs, scientific simulations.
- **New and Sophisticated Applications**: The development of new applications requires a diverse set of skills and knowledge from various disciplines.

## Applications of Data Mining

1. **Web Page Analysis**: This includes web page classification, clustering, and the use of PageRank & HITS algorithms.

2. **Collaborative Analysis & Recommender Systems**: Data mining techniques are used to analyze user behavior and make recommendations based on patterns discovered.

3. **Basket Data Analysis to Targeted Marketing**: Data mining is used to analyze customer purchase data (basket data) to develop targeted marketing strategies.

4. **Biological and Medical Data Analysis**: This includes classification, cluster analysis (microarray data analysis), biological sequence analysis, and biological network analysis.

5. **Data Mining and Software Engineering**: Data mining techniques are applied in software engineering, for example, in issue tracking systems to predict future bugs.

6. **Major Dedicated Data Mining Systems/Tools**: Examples include SAS, MS SQL-Server Analysis Manager, Oracle Data Mining Tools. These tools provide dedicated data mining functionalities, but data mining techniques are also applied in invisible ways in various systems.

## Major issues in Data Mining

- **Mining Methodology**
  - **What**: Finding new and diverse kinds of knowledge from multi-dimensional data
  - **Why**: To solve complex and interdisciplinary problems in a networked environment
  - **How**: Using pattern evaluation, guided mining, and handling noise and uncertainty
- **User Interaction**
  - **What**: Engaging users in the mining process and using their background knowledge
  - **Why**: To improve the relevance, quality, and usefulness of the mining results
  - **How**: Using interactive mining, presentation, and visualization techniques
- **Efficiency and Scalability**
  - **What**: Improving the speed and performance of data mining algorithms
  - **Why**: To cope with large and complex data sets and real-time applications
  - **How**: Using parallel, distributed, stream, and incremental mining methods
- **Diversity of data types**
  - **What**: Dealing with complex and dynamic data sources and formats
  - **Why**: To extract meaningful and actionable insights from various types of data
  - **How**: Using specialized and adaptive mining techniques and models
- **Data mining and society**
  - **What**: Considering the social and ethical implications of data mining
  - **Why**: To protect the privacy and rights of data owners and users
  - **How**: Using privacy-preserving, invisible, and responsible data mining approaches
