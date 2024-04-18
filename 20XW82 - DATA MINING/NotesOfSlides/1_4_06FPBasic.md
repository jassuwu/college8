# Chapter 5

## Basic Concepts: Association Rules

Association rules are used to find patterns in data where the presence of one set of items is associated with the presence of another set. The strength of an association rule can be measured in terms of its support and confidence:

- **Support (s)**: The probability that a transaction contains both X and Y, i.e., the joint occurrence of items X and Y.
- **Confidence (c)**: The conditional probability that a transaction containing X also contains Y.

Given a minimum support threshold (minsup) and a minimum confidence threshold (minconf), we can identify strong association rules in the data.

### Example Transaction Data

| Tid | Items bought                     |
| --- | -------------------------------- |
| 10  | Beer, Nuts, Diaper               |
| 20  | Beer, Coffee, Diaper             |
| 30  | Beer, Diaper, Eggs               |
| 40  | Nuts, Eggs, Milk                 |
| 50  | Nuts, Coffee, Diaper, Eggs, Milk |

### Frequent Patterns and Association Rules

- **Frequent Patterns**: For minsup = 50%, the frequent patterns are Beer (3 occurrences), Nuts (3), Diaper (4), Eggs (3), and {Beer, Diaper} (3).
- **Association Rules**: For minconf = 50%, the rules include:
  - **Beer 🡪 Diaper**: With support of 60% and confidence of 100%, this rule suggests that customers who buy beer also buy diapers.
  - **Diaper 🡪 Beer**: With support of 60% and confidence of 75%, this rule suggests that customers who buy diapers also tend to buy beer.

These rules can be used for various purposes such as market basket analysis, recommendation systems, and more.

## Closed Patterns and Max-Patterns

- **Closed Patterns**: An itemset X is closed if it is frequent and no super-pattern Y ⊇ X exists with the same support as X. This concept helps in lossless compression of frequent patterns.
- **Max-Patterns**: An itemset X is a max-pattern if it is frequent and no frequent super-pattern Y ⊇ X exists. This helps in reducing the number of patterns and rules to analyze.

### Exercise Solution

Given the database DB = {<a1, …, a100>, <a1, …, a50>} with min_sup = 1:

- **Set of Closed Itemsets**:

  - <a1, …, a100>: 1 (occurs once)
  - <a1, …, a50>: 2 (occurs twice)

- **Set of Max-Pattern**:

  - <a1, …, a100>: 1 (since no super-pattern exists that is frequent)

- **Set of All Patterns**:
  - Since the min_sup is 1, all subsets of <a1, …, a100> and <a1, …, a50> are considered patterns. However, listing them all would result in a combinatorial explosion, similar to the example given with 2^100 - 1 sub-patterns.

## Scalable Frequent Itemset Mining Methods

Scalable frequent itemset mining methods are essential for analyzing large datasets to find patterns that occur frequently. These methods leverage the **downward closure property**, which states that all subsets of a frequent itemset must also be frequent.

## Key Approaches

### Apriori Algorithm

- **Type**: Candidate Generation-and-Test Approach.
- **Principle**: If an itemset is infrequent, its supersets are not tested.
- **Process**:
  1. Scan the database to find frequent 1-itemsets.
  2. Generate candidate itemsets of size \( k+1 \) from frequent itemsets of size \( k \).
  3. Test candidates against the database.
  4. Continue until no new frequent itemsets are found.

### FPGrowth

- **Type**: Frequent Pattern-Growth Approach.
- **Advantage**: Does not require candidate generation.

### ECLAT

- **Type**: Vertical Data Format Approach.
- **Benefit**: Efficient for dense datasets and works well with sparse datasets too.

## Apriori Algorithm Details

### Candidate Generation & Test

- **Candidate Generation**:
  1. Self-join \( L_k \) itemsets.
  2. Prune candidates not found in \( L\_{k-1} \).

### Support Counting

- **Challenge**: Counting supports of candidates can be complex due to the vast number of candidates.
- **Solution**: Use a hash-tree to store candidates and count occurrences.

### SQL Implementation

- **Self-Joining**: Combine items from \( L\_{k-1} \) to form \( C_k \).
- **Pruning**: Remove itemsets from \( C*k \) if any \( (k-1) \)-subset is not in \( L*{k-1} \).

## Example: Apriori Algorithm

```sql
-- Candidate Generation
INSERT INTO Ck
SELECT p.item1, p.item2, ..., p.itemk-1, q.itemk-1
FROM Lk-1 p, Lk-1 q
WHERE p.item1=q.item1, ..., p.itemk-2=q.itemk-2, p.itemk-1 < q.itemk-1;

-- Pruning
FORALL itemsets c in Ck DO
  FORALL (k-1)-subsets s of c DO
    IF (s is not in Lk-1) THEN
      DELETE c FROM Ck;
```

# Improving the Efficiency of Apriori

## Computational Challenges

- Multiple database scans
- Large number of candidate itemsets
- Intensive support counting workload

## Strategies for Improvement

- **Reduce Database Scans**: Limit the number of passes over the transaction database.
- **Shrink Candidates**: Decrease the number of candidate itemsets.
- **Ease Support Counting**: Simplify the process of counting support for candidates.

## Specific Methods

### Partitioning

- **Concept**: Partition the database and identify frequent itemsets locally before a global consolidation.
- **Process**:
  1. First scan partitions the database to find local frequent patterns.
  2. Second scan consolidates these patterns to determine global frequency.

### DHP (Direct Hashing and Pruning)

- **Idea**: Utilize a hash table to reduce the number of candidates.
- **Example**: If the combined count of hash entries `{ab, ad, ae}` is below the threshold, `ab` is not considered a candidate.

### Sampling

- **Approach**: Mine a sample of the database to find frequent patterns.
- **Verification**: Check only the borders of closure of frequent patterns in the full database to verify their frequency.

### DIC (Dynamic Itemset Counting)

- **Lattice Structure**: Utilize a lattice structure to dynamically count itemsets.
- **Efficiency**: Begin counting composite itemsets only after all their subsets are determined frequent.

## FPGROWTH IN BOOK

## ELCAT

## MINING CLOSE PATTERNS ETC ETC
