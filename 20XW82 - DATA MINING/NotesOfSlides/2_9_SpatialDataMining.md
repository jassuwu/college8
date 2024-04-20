# Spatial Data Mining

## Applications and Trends in Data Mining

### Spatial Databases

- **Definition**: A spatial database is a specialized database that stores a significant amount of space-related data.
- **Examples of Data**:

  - **Maps**: Geographical maps representing different regions.
  - **Remote Sensing Data**: Preprocessed data from satellite images or aerial photography.
  - **Medical Imaging Data**: Images from medical scans like MRIs or CT scans.
  - **VLSI Chip Layout Data**: Design data for the layout of integrated circuits.

- **Characteristics**:
  - **Topological Information**: Data that defines the relationships between different spatial elements.
  - **Distance Information**: Data that includes measurements of space between objects or points.
  - **Spatial Indexing Structures**: Advanced, multidimensional structures for organizing and accessing spatial data.

## Spatial Data Mining

- **Purpose**: To discover knowledge, spatial relationships, and patterns that are not explicitly stored in the spatial databases.
- **Process**: Involves the analysis of spatial data to identify trends, correlations, and anomalies that can provide valuable insights.

## Dimensions in a Spatial Data Cube

Spatial data cubes are powerful tools for organizing and analyzing spatial data. They consist of various dimensions that can be categorized as follows:

### Nonspatial Dimension

- **Definition**: Contains only nonspatial data.
- **Characteristics**:
  - Data does not include any spatial component.
  - Generalizations are also nonspatial.
- **Examples**:
  - **Temperature**: Can be generalized to terms like "hot".
  - **Precipitation**: Can be generalized to terms like "wet".

### Spatial-to-Nonspatial Dimension

- **Definition**: Primitive-level data are spatial, but generalizations become nonspatial.
- **Characteristics**:
  - Initial data points are spatial.
  - Higher-level generalizations are represented nonspatially.
- **Example**:
  - **City**: Geographic data like "Seattle" can be generalized to a nonspatial term "pacific northwest".

### Spatial-to-Spatial Dimension

- **Definition**: Both primitive level and high-level generalized data are spatial.
- **Characteristics**:
  - All levels of data maintain their spatial nature.
- **Example**:
  - **Equi Temperature Region**: Spatial data with generalizations like regions covering 0-5<sup>∘</sup>C and 5-10<sup>∘</sup>C.

## Measures in a Spatial Data Cube

### Types of Measures

- **Numerical Measure**: Contains purely numerical data.

  - **Example**: Monthly revenue of a region, which can be aggregated to compute annual revenue by county.

- **Spatial Measure**: Comprises a set of pointers to spatial objects.
  - **Usage**: Helps in identifying the location of objects in space.

### Mining Spatial Association & Co-location Patterns

- **Spatial Association Rule**: Defined as `A ⇒ B [s%, c%]`, where:
  - `A` and `B` are sets of spatial or nonspatial predicates.
  - `s%` represents the support percentage of the rule.
  - `c%` represents the confidence percentage of the rule.

Example Rule

- **Rule**: `is_a(X, "school") ∧ close_to(X, "sports center") ⇒ close_to(X, "park") [0.5%, 80%]`
- **Interpretation**: 80% of schools that are close to sports centers are also close to parks, with 0.5% of the data fitting this scenario.

## Spatial Cluster and Classification

### Spatial Clustering Methods

- **Purpose**: To identify clusters or densely populated regions in a large, multidimensional dataset.
- **Process**: Uses distance measurements to determine cluster formation.

### Spatial Classification

- **Objective**: To analyze spatial objects and derive classification schemes.
- **Relevance**: Focuses on spatial properties like the proximity to districts, highways, or rivers.

### Spatial Trend Analysis

- **Goal**: To detect changes and trends along a spatial dimension.
- **Common Use**: Often used for temporal pattern changes in time-series data, tracking how patterns evolve over time.

## [APRIORI GRAPH](https://docs.google.com/presentation/d/1ymkjbF8m0VFrsQnsu_vL70C14sZCtrlP/edit#slide=id.p11)

## AGM and FSG Algorithms

### AGM Algorithm

- **Type**: Vertex-based candidate generation.
- **Process**:
  - Increases substructure size by one vertex at each AprioriGraph iteration.
  - Joins two size-k frequent graphs if they share a size-(k−1) subgraph.
- **Graph Size**: Defined by the number of vertices.
- **Candidate Formation**:
  - Includes the common size-(k−1) subgraph.
  - Adds two additional vertices from the size-k patterns.

### FSG Algorithm

- **Type**: Edge-based candidate generation.
- **Process**:
  - Increases substructure size by one edge per AprioriGraph call.
  - Merges two size-k patterns if they share a core subgraph with k − 1 edges.
- **Graph Size**: Defined by the number of edges.
- **Candidate Formation**:
  - Includes the core.
  - Adds two additional edges from the size-k patterns.

## [PATTERN GROWTH GRAPH](https://docs.google.com/presentation/d/1ymkjbF8m0VFrsQnsu_vL70C14sZCtrlP/edit#slide=id.p15)
