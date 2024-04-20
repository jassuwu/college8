# Chapter 8: Mining Sequence Patterns in Transactional Databases

## 8.3 Sequence Databases & Sequential Patterns

### Transaction vs. Time-Series vs. Sequence Databases

- **Transaction databases**: Record transactions at a point in time.
- **Time-series databases**: Store data points collected or computed at successive times.
- **Sequence databases**: Keep track of sequences of events or objects.

### Frequent Patterns vs. Sequential Patterns

- **Frequent patterns**: Regularly occurring patterns within a dataset.
- **Sequential patterns**: Patterns that involve sequences with ordered elements.

### Applications of Sequential Pattern Mining

- **Customer shopping sequences**: Predicting future purchases based on past sequences.
- **Medical treatments**: Understanding treatment sequences and outcomes.
- **Natural disasters**: Analyzing event sequences like earthquakes.
- **Science & engineering processes**: Monitoring sequences in experiments or production.
- **Stocks and markets**: Tracking sequences of market movements.
- **Telecommunication**: Examining call patterns.
- **Weblog clickstreams**: Studying navigation patterns.
- **DNA sequences**: Researching gene structures and functions.

## What Is Sequential Pattern Mining?

- **Objective**: Discover all frequent subsequences within a set of sequences.
- **Example**: For a sequence `< (ef) (ab) (df) c b >`, find all frequent subsequences.

### A Sequence Database Example

| SID | Sequence            |
| --- | ------------------- |
| 10  | `<a(abc)(ac)d(cf)>` |
| 20  | `< (ad)c(bc)(ae) >` |
| ... | ...                 |

- **Elements**: May contain a set of items, listed alphabetically and unordered.
- **Subsequence**: A sequence that can be derived from another by deletion, e.g., `<a(bc)dc>` from `<a(abc)(ac)d(cf)>`.
- **Sequential Pattern**: A subsequence that meets a minimum support threshold, e.g., `<(ab)c>` with `min_sup = 2`.

### Challenges in Sequential Pattern Mining

- **Complexity**: Databases can contain a vast number of hidden sequential patterns.
- **Efficiency**: Algorithms must be efficient, scalable, and minimize database scans.
- **Constraints**: Ability to handle user-specific constraints is crucial.

### Sequential Pattern Mining Algorithms

- **Apriori-like Algorithm**: Introduced by Agrawal & Srikant, ICDE’95.
- **GSP**: Generalized Sequential Patterns by Srikant & Agrawal, EDBT’96.
- **Pattern-Growth Methods**: FreeSpan & PrefixSpan by Han et al., KDD’00; Pei et al., ICDE’01.
- **Vertical Format Mining**: SPADE by Zaki, Machine Learning’00.
- **Constraint-Based Mining**: SPIRIT by Garofalakis et al., VLDB’99; Pei et al., CIKM’02.
- **Closed Patterns**: CloSpan by Yan, Han & Afshar, SDM’03.

### The Apriori Property of Sequential Patterns

- **Principle**: If a sequence is not frequent, its super-sequences won't be frequent either.
- **Example**: If `<hb>` is infrequent, so are `<hab>` and `<(ah)b>`.

Given Support Threshold `min_sup = 2`

| Seq. ID | Sequence            |
| ------- | ------------------- |
| 10      | `< (bd)cb(ac) >`    |
| 20      | `< (bf)(ce)b(fg) >` |
| ...     | ...                 |

## GSP—Generalized Sequential Pattern Mining

### Overview

- **Proposed by**: Agrawal and Srikant, EDBT’96.
- **Purpose**: To identify frequent sequences in a database.

### Method Outline

1. Start with each item in the database as a length-1 candidate.
2. For each level (sequences of length-k):
   - Scan the database to collect support count for each candidate sequence.
   - Generate length-(k+1) candidates from length-k frequent sequences using the Apriori principle.
   - Repeat until no frequent sequences or candidates are found.

### Strengths

- **Major strength**: Efficient candidate pruning using the Apriori principle.

### Finding Length-1 Sequential Patterns

- Initial candidates: All singleton sequences (`<a>`, `<b>`, `<c>`, etc.).
- Scan the database once to count support for candidates.

Example of Support Count

| Candidate | Support |
| --------- | ------- |
| `<a>`     | 3       |
| `<b>`     | 5       |
| ...       | ...     |

- Given `min_sup = 2`, sequences like `<a>`, `<b>`, `<c>`, and `<d>` are considered frequent.

### Generating Length-2 Candidates

- Use the Apriori principle to prune non-frequent candidates.
- Without Apriori, there would be 92 candidates.
- With Apriori, 44.57% of candidates are pruned.

Example of Length-2 Candidates

- From `<a>`: `<aa>`, `<ab>`, `<ac>`, `<ad>`, `<ae>`, `<af>`.
- From `<b>`: `<ba>`, `<bb>`, `<bc>`, `<bd>`, `<be>`, `<bf>`.
- ... and so on, resulting in 51 length-2 candidates.

## Apriori Property

- **Basic Principle**: If a sequence is not frequent, its super-sequences will not be frequent.
- **Example**: If `<hb>` is infrequent, then `<hab>` and `<(ah)b>` are also infrequent.

### Drawbacks of Candidate Generate-and-Test Method

- **Large Number of Candidates**: Generates a massive set of candidate sequences, particularly problematic for 2-item sequences.

- **Multiple Database Scans**: Requires several passes over the database, increasing with the length of the sequences.

- **Inefficient for Long Patterns**: As the length of each candidate increases by one with each scan, it becomes inefficient for mining longer sequential patterns.

- **Exponential Growth**: The number of short patterns grows exponentially with the length of the patterns being mined, leading to scalability issues.

## The SPADE Algorithm

### Overview

- **Developed by**: Zaki in 2001.
- **Type**: Vertical format sequential pattern mining method.
- **Process**: Maps a sequence database to a set of items, each represented as `<SID, EID>`, and mines sequential patterns by growing subsequences one item at a time using Apriori candidate generation.

### Bottlenecks of GSP and SPADE

- **Candidate Generation**: A vast number of candidates can be generated; for instance, 1,000 frequent length-1 sequences can lead to a huge number of length-2 candidates.

- **Database Scans**: Multiple scans of the database are required during the mining process.

- **Search Method**: Utilizes a breadth-first search approach.

- **Mining Long Patterns**: The mining of long sequential patterns is challenging due to the need for an exponential number of short candidates. For example, a length-100 sequential pattern would require 10<sup>30</sup> candidate sequences.

## The Prefix SPAN Algorithm

[EXAMPLES AND MORE](https://docs.google.com/presentation/d/1tXIAfCtmbR3HqJmaZ4K-3PKSXigtlhpG/edit#slide=id.p24)
