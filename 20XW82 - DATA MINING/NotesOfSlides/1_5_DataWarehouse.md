# Data Warehousing

## Definition

A **Data Warehouse** is a decision support database that is maintained separately from the organization's operational database. It supports information processing by providing a solid platform of consolidated, historical data for analysis. In essence, a data warehouse is a subject-oriented, integrated, time-variant, and nonvolatile collection of data in support of management's decision-making process.

## Key Characteristics

### Subject-Oriented

Data warehouses are organized around major subjects, such as customer, product, sales, etc. They focus on the modeling and analysis of data for decision makers, not on daily operations or transaction processing. They provide a simple and concise view around particular subject issues by excluding data that are not useful in the decision support process.

### Integrated

Data warehouses are constructed by integrating multiple, heterogeneous data sources such as relational databases, flat files, and online transaction records. Data cleaning and data integration techniques are applied to ensure consistency in naming conventions, encoding structures, attribute measures, etc., among different data sources.

### Time Variant

The time horizon for the data warehouse is significantly longer than that of operational systems. Operational databases focus on current value data, while data warehouse data provide information from a historical perspective (e.g., past 5-10 years). Every key structure in the data warehouse contains an element of time, explicitly or implicitly.

### Nonvolatile

A data warehouse is a physically separate store of data transformed from the operational environment. Operational updates of data do not occur in the data warehouse environment. It does not require transaction processing, recovery, and concurrency control mechanisms. It requires only two operations in data accessing: initial loading of data and access of data.

## Online Analytical Processing (OLAP)

OLAP is a technology that enables multi-dimensional analysis of business data, providing interactive access to large amounts of data and supporting complex calculations and data aggregation. It is used to support business intelligence and decision-making processes.

## [OLTP vs. OLAP](https://docs.google.com/presentation/d/1Pe9nD5pLMFS89conZdlr5GH2ta2DetoX/edit#slide=id.p8)

## Data Cube

A data cube is a multi-dimensional matrix for data grouping. It can be classified into two categories:

- **Multidimensional Data Cube**: Stores large amounts of data using a multi-dimensional array, increasing efficiency by indexing each dimension.
- **Relational Data Cube**: Stores large amounts of data using relational tables, each displaying the dimensions of the data cube.

### Advantages of Data Cubes

- **Multi-dimensional Analysis**: Enables viewing data from different perspectives and levels of detail.
- **Interactivity**: Provides interactive access to large amounts of data.
- **Speed and Efficiency**: Optimized for OLAP analysis, enabling fast querying and aggregation of data.
- **Data Aggregation**: Supports complex calculations and data aggregation.
- **Improved Decision-making**: Provides a clear and comprehensive view of business data.
- **Accessibility**: Can be accessed from a variety of devices and platforms.

### Disadvantages of Data Cubes

- **Complexity**: Can be complex to set up and maintain.
- **Data Size Limitations**: May struggle with very large data sets.
- **Performance Issues**: Can be slow when dealing with large amounts of data.
- **Data Integrity**: Inconsistent data definitions and data quality issues can affect the accuracy of OLAP analysis.
- **Cost**: Can be expensive due to the need for specialized hardware and software.
- **Inflexibility**: May not easily accommodate changing business needs.

## Data Warehouse

A data warehouse is a decision support database that is maintained separately from the organization's operational database. It provides a solid platform of consolidated, historical data for analysis.

### Why a Separate Data Warehouse?

- **High Performance**: DBMS is tuned for OLTP, while the warehouse is tuned for OLAP.
- **Different Functions and Data**: Decision support requires historical data, data consolidation, and data quality.

### 3 Data Warehouse Models

- **Enterprise Warehouse**: Collects all information about subjects spanning the entire organization.
- **Data Mart**: A subset of corporate-wide data that is of value to specific groups of users.
- **Virtual Warehouse**: A set of views over operational databases.

### Extraction, Transformation, and Loading (ETL)

- **Data Extraction**: Retrieving data from multiple, heterogeneous, and external sources.
- **Data Cleaning**: Detecting and rectifying errors in the data.
- **Data Transformation**: Converting data from legacy or host format to warehouse format.
- **Load**: Sorting, summarizing, consolidating, computing views, checking integrity, and building indices and partitions.
- **Refresh**: Propagating the updates from the data sources to the warehouse.

### Metadata Repository

- **Structural Description**: Schema, view, dimensions, hierarchies, derived data definitions, data mart locations, and contents.
- **Operational Metadata**: Data lineage (history of migrated data and transformation path), currency of data (active, archived, or purged), monitoring information (warehouse usage statistics, error reports, audit trails).
- **Summarization Algorithms**: The algorithms used for summarization.
- **Mapping**: The mapping from the operational environment to the data warehouse.
- **Performance Data**: Warehouse schema, view, and derived data definitions.
- **Business Data**: Business terms and definitions, ownership of data, charging policies.

## From Tables and Spreadsheets to Data Cubes

### Data Warehouse and Multidimensional Data Model

A data warehouse employs a **multidimensional data model** which organizes data into a **data cube** format, enabling it to be modeled and analyzed across various dimensions.

### Components of a Data Cube

- **Dimension Tables**: Contain attributes related to dimensions such as `item (item_name, brand, type)` or `time (day, week, month, quarter, year)`.
- **Fact Table**: Stores measures like `dollars_sold` and keys that link to each of the related dimension tables.

### Structure of Data Cubes

- **Lattice of Cuboids**: Represents the hierarchy of cuboids forming the data cube, from the most detailed to the most summarized data.
- **Apex Cuboid**: The 0-D cuboid, also known as the apex cuboid, contains the highest level of summarization.
- **Base Cuboid**: The n-D base cube represents the detailed level of data.

## Conceptual Modeling of Data Warehouses

Data warehouses are modeled based on **dimensions** (which provide context for analysis, like time, location, product) and **measures** (which are the quantitative data points, like sales figures).

### Schemas in Data Warehousing

- **Star Schema**: Central fact table connected to a set of dimension tables.
- **Snowflake Schema**: A more complex version of the star schema where dimension tables are normalized into smaller tables, resembling a snowflake.
- **Galaxy Schema**: Multiple fact tables share dimension tables, forming a complex structure often referred to as a galaxy schema or fact constellation.

[Examples](https://docs.google.com/presentation/d/1Pe9nD5pLMFS89conZdlr5GH2ta2DetoX/edit#slide=id.p23)

### Data Cube Measures

- **Distributive**: Functions like `count()`, `sum()`, `min()`, and `max()` where the result doesn't change whether applied to partitioned aggregates or as a whole.
- **Algebraic**: Functions that can be computed using a bounded number of arguments from distributive functions, such as `avg()`, `min_N()`, and `standard_deviation()`.
- **Holistic**: Functions without a bounded storage size for subaggregates, like `median()`, `mode()`, and `rank()`.

### Typical OLAP Operations

- **Roll Up (Drill-Up)**: Summarizing data by climbing up a hierarchy or reducing dimensions.
- **Drill Down (Roll Down)**: Going from a higher-level summary to a more detailed view or adding new dimensions.
- **Slice and Dice**: Selecting and projecting data in various dimensions.
- **Pivot (Rotate)**: Reorienting the multidimensional view of data, like rotating a 3D cube to see different 2D planes.
- **Drill Across**: Involving more than one fact table for analysis.
- **Drill Through**: Accessing the underlying relational data through SQL queries.

[Example](https://docs.google.com/presentation/d/1Pe9nD5pLMFS89conZdlr5GH2ta2DetoX/edit#slide=id.p32)

## Design of Data Warehouse: A Business Analysis Framework

### Four Views of Data Warehouse Design

- **Top-down View**: Focuses on selecting relevant information necessary for the data warehouse.
- **Data Source View**: Exposes the information captured, stored, and managed by operational systems.
- **Data Warehouse View**: Comprises fact tables and dimension tables.
- **Business Query View**: Represents the end-user's perspective of data in the warehouse.

### Data Warehouse Design Process

- **Approaches**: Can be top-down (starting with overall design and planning), bottom-up (starting with experiments and prototypes), or a combination of both.
- **Methodologies**:
  - **Waterfall**: Structured and systematic analysis at each step.
  - **Spiral**: Rapid generation of increasingly functional systems with quick iterations.
- **Steps**:
  1. Choose a business process to model (e.g., orders, invoices).
  2. Choose the grain of the business process (atomic level of data).
  3. Choose dimensions for each fact table record.
  4. Choose measures to populate each fact table record.

### Data Warehouse Usage

- **Information Processing**: Supports querying, basic statistical analysis, and reporting (crosstabs, tables, charts, graphs).
- **Analytical Processing**: Multidimensional analysis of data warehouse data, supporting OLAP operations like slicing, dicing, drilling, and pivoting.
- **Data Mining**: Discovery of knowledge from hidden patterns, supporting associations, analytical model construction, classification, prediction, and presentation of results through visualization tools.

Sure, here are your notes in Markdown format:

## From On-Line Analytical Processing (OLAP) to On Line Analytical Mining (OLAM)

### Why Online Analytical Mining?

- **High quality of data** in data warehouses: Data warehouses contain integrated, consistent, and cleaned data.
- **Available information processing structure** surrounding data warehouses: This includes ODBC, OLEDB, Web accessing, service facilities, reporting, and OLAP tools.
- **OLAP-based exploratory data analysis**: Mining involves drilling, dicing, pivoting, etc.
- **On-line selection of data mining functions**: This allows for the integration and swapping of multiple mining functions, algorithms, and tasks.

### Efficient Data Cube Computation

- A **data cube** can be viewed as a lattice of cuboids. The bottom-most cuboid is the base cuboid. The top-most cuboid (apex) contains only one cell.
- **Materialization of data cube**: This can be full (every cuboid), none (no materialization), or partial (some cuboids). The selection of which cuboids to materialize is based on factors such as size, sharing, and access frequency.

### The “Compute Cube” Operator

- Cube definition and computation in DMQL: `define cube sales [item, city, year]: sum (sales_in_dollars)`, `compute cube sales`.
- This can be transformed into a SQL-like language with a new operator `cube by`, introduced by Gray et al.’96.

```sql
SELECT item, city, year, SUM (amount)
FROM SALES
CUBE BY item, city, year
```

### Indexing OLAP Data: Bitmap Index

- An index on a particular column where each value in the column has a bit vector. Bit operations are fast.
- The length of the bit vector is the number of records in the base table.
- The i-th bit is set if the i-th row of the base table has the value for the indexed column.
- This is not suitable for high cardinality domains. However, a recent bit compression technique, Word-Aligned Hybrid (WAH), makes it work for high cardinality domain as well.

### Indexing OLAP Data: Join Indices

- A join index: `JI(R-id, S-id)` where `R (R-id, …)  S (S-id, …)`.
- Traditional indices map the values to a list of record ids.
- It materializes relational join in JI file and speeds up relational join.
- In data warehouses, a join index relates the values of the dimensions of a start schema to rows in the fact table.

### Efficient Processing OLAP Queries

- Determine which operations should be performed on the available cuboids.
- Transform drill, roll, etc. into corresponding SQL and/or OLAP operations, e.g., dice = selection + projection.
- Determine which materialized cuboid(s) should be selected for OLAP operation.
- Explore indexing structures and compressed vs. dense array structures in MOLAP.
