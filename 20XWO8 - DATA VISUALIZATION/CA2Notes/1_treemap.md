# Treemaps

## Why Use Treemaps?

Treemaps are rectangle-based visualizations used to represent hierarchically-ordered (tree-structured) data. They allow for the comparison of quantities and the identification of patterns within a physically restricted space. Treemaps are not designed to indicate exact numerical values, but to break down the dataset into its constituent parts and quickly identify its larger and smaller components.

Treemaps can also indicate rankings, differences between parts, and relative proportions in non-hierarchical structures. Sometimes, they are considered an alternative to traditional pie charts.

## How Do Treemaps Work?

Treemaps are composed of nested rectangles (tiles) whose areas are proportional to the data they represent. The larger rectangles indicate the root or main branches of the data tree, and are subdivided into smaller rectangles that indicate the sizes of the nodes (lower levels of the hierarchy) that each branch of the tree has. The numerical values of the dataset should correspond to the areas of the rectangles.

Color is used intelligently in Treemaps to incorporate new dimensions into the diagram. It is used to indicate a second categorical or quantitative value. Therefore, a ranking is indicated by the changes in the intensity of a single color; different positive and negative quantitative values are displayed by the changes in the intensity of two colors.

## Precautions When Using Treemaps

- Treemaps are difficult to read as they rely on the audience’s ability to decode numerical information by comparing areas. Humans are good at evaluating distances and bad at calculating areas. This drawback is amplified in a Treemap due to the large number of areas (rectangles, tiles) that are displayed on them.
- Treemaps are not advisable when the significant information has similar numerical values. In such cases, the algorithm generates blocks of very similar areas, difficult to compare in a dashboard.
- Treemaps cannot be used to display numerical variables that can take negative values such as losses.
- Be cautious if you want to use them in interactive presentations. Comparing areas that change interactively is even more complicated.
- Another issue that makes it difficult to make a good comparison is the absence of a common baseline, a drawback that bar charts do not have.
- It is generally not possible to include text in smaller rectangles when the differences in size between large and small blocks are very significant. The standard solution is to use tooltips to provide the information related to those rectangles when the user hovers over them.

Stephen Few's opinion on the subject: “When conventional graphs, such as bar graphs, cannot be used because there are too many items to represent as bars in a single graph or even a series of graphs on a single screen, Treemaps solve the problem by making optimal use of screen space. Because they rely on pre-attentive attributes to encode values (area and color) that we can’t compare precisely, we reserve such methods for circumstances when other more precise visualizations cannot be used, or precision isn’t necessary.”
