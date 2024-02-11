# Page 7

## Closed Patterns and Max-Patterns

- A long pattern can contain a combinatorial number of sub-patterns. For example, a pattern of length 100 can have up to 1.27\*10^30 sub-patterns!

- To manage this complexity, we can mine **closed patterns** and **max-patterns**.

- A **closed pattern** is an itemset that is frequent (appears often in the dataset) and has no super-pattern with the same support. In other words, it's a pattern that provides a complete and concise representation of the data.

- A **max-pattern** is an itemset that is frequent but has no frequent super-pattern. It represents the "maximum" pattern that still meets the frequency threshold.

- Mining closed and max-patterns helps reduce the number of patterns and rules we need to consider, making the data easier to analyze and understand.

## Exercise.

    DB = {`<a1, …, a100>`, `< a1, …, a50>`}
    Min_sup = 1.

1. **Closed Itemsets**:

   - `<a1, …, a100>` with a support of 1
   - `<a1, …, a50>` with a support of 2

2. **Max-Patterns**:

   - `<a1, …, a100>` with a support of 1

3. **All Patterns**:
   - This would be a very large set containing all possible combinations of the items `<a1, …, a100>`. However, since the minimum support is 1, any pattern that appears at least once in the database would be considered a valid pattern.
