# Data Visualization

## Visualization Components

Data visualization is built on four key components: **Visual Cues**, **Coordinate Systems**, **Scales**, and **Context**. Each visualization, regardless of its position on the spectrum, is constructed on these four components, which are driven by data. They can be explicitly displayed or form an invisible framework. The components work together, and your choice with one affects the others.

### Visual Cues

Visualization, in its most basic form, is simply mapping data to geometry and color. It works because our brains are wired to find patterns, and we can switch back and forth between the visual and the numbers it represents. It's crucial to ensure that the essence of the data isn’t lost in that back and forth between visual and the value it represents. If you can’t map back to the data, the visualization is just a bunch of shapes. The right visual cue must be chosen, which changes by purpose, and it must be used correctly, which depends on how we perceive the varied shapes, sizes, and shades.

1. Position
2. Length
3. Angle
4. Direction
5. Shapes
6. Area in 2D space
7. Volume in 3D space
8. Color Saturation
9. Color Hue

### Coordinate Systems

When you encode data, you eventually must place the objects somewhere. There’s a structured space and rules that dictate where the shapes and colors go. This is the coordinate system, which gives meaning to an x-y coordinate or a latitude and longitude pair. There are several systems, but three cover most of your bases:

1. Cartesian
2. Polar
3. Geographic

### Scales

While coordinate systems dictate the dimensions of a visualization, scale dictates where in those dimensions your data maps to. There’s a variety of them, and you can even define your own scales based on mathematical functions, but most likely you’ll rarely stray from the ones commonly used. These can be grouped into three categories: numeric, categorical, and time.

### Context

Context is the information that lends to better understanding the who, what, when, where, and why of your data. It can make the data clearer for readers and point them in the right direction. At the least, it can remind you what a graph is about when you come back to it a few months later.

## [Four Pillars of Data Visualization](https://freedium.cfd/https://towardsdatascience.com/4-pillars-of-data-visualization-distribution-relationship-composition-comparison-935cf9248f97)

Data visualization is a powerful tool that allows us to represent complex data in a simple and intuitive way. The four pillars of data visualization are **Distribution**, **Relationship**, **Composition**, and **Comparison**.

### 1. Distribution

Distribution refers to the probability of occurrence of an outcome. For example, in a distribution of 100 coin flips, how many will get heads and how many tails? Frequency distributions like this are presented in histograms or curves.

A classic representation of dispersion, which shows how a variable is dispersed/spread with respect to its central tendency, is the boxplot. For instance, a boxplot could represent the distribution of the number of air passengers on Saturdays over a number of years, revealing the mean/median number of passengers, the minimums and maximums, the outliers, and more.

### 2. Relationship

The relationship between two or more variables is another fundamental aspect of data visualization. For example, trees grow taller as they get older in the early years, indicating a relationship between height and age. Similarly, the price of a house depends on the number of beds, number of bathrooms, location, square footage, etc., indicating a relationship between one dependent and many explanatory variables.

### 3. Comparison

Comparison is the third cornerstone of data visualization. This kind of visual material compares multiple variables in datasets or multiple categories within a single variable. For instance, a bar chart could be used to compare salaries between two groups of observations (scientists vs lawyers), or a line chart could compare GDP between two countries (UK and Canada) over time.

### 4. Composition

Composition charts, such as stacked bar charts or pie charts, show the composition of one or more variables in absolute numbers and in normalized forms (e.g., percentage). While these old-school visualization techniques have limited use cases today, they can sometimes present information in a visually aesthetic and familiar, vintage fashion.

The choice of visualization depends on the data and the kind of information we want to communicate. Each of these four pillars provides a different perspective on the data, helping us to understand and interpret it more effectively.

## Vector vs Raster Graphics

### Pixel and Bitmap

In computer graphics, a **pixel**, or picture element, is the smallest addressable element of a picture represented on a screen. Most images we see on our computer screens are **raster images**, made up of a collection of pixels referred to as a **bitmap**. A bitmap is a mapping from some domain (for example, a range of integers) to bits, that is, values which are zero or one. It is also called a bit array or bitmap index.

### Raster Graphics

**Raster graphics** use bitmaps to store information. This means a large file needs a large bitmap. The larger the image, the more disk space the image file will take up. For example, a 640 x 480 image requires information to be stored for 307,200 pixels, while a 3072 x 2048 image (from a 6.3 Megapixel digital camera) needs to store information for a whopping 6,291,456 pixels. Algorithms are used to compress images to help reduce these file sizes. Image formats like jpeg and gif are common compressed image formats. Scaling down these images is easy but enlarging a bitmap makes it pixelated or simply blurred. Hence for images that need to scale to different sizes, we use vector graphics.

File extensions: .BMP, .TIF, .GIF, .JPG

### Vector Graphics

**Vector graphics** make use of sequential commands or mathematical statements or programs which place lines or shapes in a 2-D or 3-D environment. Vector graphics are best for printing since it is composed of a series of mathematical curves. As a result, vector graphics print crisply even when they are enlarged. In vector graphics, the file is created and saved as a sequence of vector statements. Rather than having a bit in the file for each bit of line drawing, we use commands which describe a series of points to be connected. As a result, a much smaller file is obtained.

File extensions: SVG, EPS, PDF, AI, DXF

### Conversions

- **Vector to Raster**: Printers and display devices are raster devices. As a result, we need to convert vector images to raster format before they can be used i.e displayed or printed. The required resolution plays a vital role in determining the size of the raster file generated. Here it is important to note that the size of the vector image to be converted always remains the same. It is convenient to convert a vector file to a range of bitmap/raster file formats but going down the opposite paths is harder.

- **Raster to Vector**: Image tracing in computing can be referred to as vectorization and it’s simply the conversion of raster images to vector images. An interesting application of vectorization is to update images and recover work. Vectorization can be used to retrieve information that we have lost. Paint in Microsoft Windows produces a bitmap output file. It is easy to notice jagged lines in Paint. In this kind of conversion, the image size reduces drastically. As a result, an exact conversion is not possible in this scenario. Due to various approximations and editing that are done in the process of conversion the converted images are not of good quality.

### Differences between Vector and Raster Graphics

The main difference between vector and raster graphics is that raster graphics are composed of pixels, while vector graphics are composed of paths. A raster graphic, such as a gif or jpeg, is an array of pixels of various colors, which together form an image.

|                    | Raster Graphics                                                                                         | Vector Graphics                                                               |
| ------------------ | ------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| Composition        | Composed of pixels.                                                                                     | Composed of paths.                                                            |
| Refresh Process    | Refresh process is independent of the complexity of the image.                                          | Displays flicker when the number of primitives in the image become too large. |
| Graphic Primitives | Specified in terms of end points and must be scan converted into corresponding pixels.                  | Scan conversion is not required.                                              |
| Drawing            | Can draw mathematical curves, polygons and boundaries of curved primitives only by pixel approximation. | Draw continuous and smooth lines.                                             |
| Cost               | Cost less.                                                                                              | Cost more as compared to raster graphics.                                     |
| Space              | Occupy more space which depends on image quality.                                                       | Occupy less space.                                                            |
| File Extensions    | .BMP, .TIF, .GIF, .JPG                                                                                  | .SVG, .EPS, .PDF, .AI, .DXF                                                   |
