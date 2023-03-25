<div align="center">

# Principal component analysis

## Description Univariee
----------

| Categories | Frequencies |
| -------- | ------- |
|     1    |    0,57    |
|     2    |    0,43    |

Study of the frequency of healthy patients (without crystals in the urine) with the value 1 and sick patients (with crystals in the urine) with the value 2.
We observe a total of 77 patients in this table while we had 79 in the study. <br>
We voluntarily deleted 2 patients because they had missing values.

| Variables | Means | Mode | Median | Standard deviation |
| -------- | ------- | -------- | ------- | ------- |
|     gravity    |    1.018    |    1.02    |    1.018    |    0.0073    |
|     pH    |    6.040    |    6.13    |    5.94    |    0.722    |
|   mOsm    |    613.6    |    577    |    594   |    239.47    |
|   mMho    |    20.90    |    23.6    |    21.4    |    8.00    |
|   Urea    |    262.4    |   224    |   255   |    130.5    |
|   Calcium    |    4.16    |    4.49   |    3.16    |    3.297    |

<img width="600px" src="https://user-images.githubusercontent.com/116463750/227734739-7b8c8bdd-7e5a-49d9-8259-0a73ac5b18f2.png">

## Bivariate Description
----------

We have created correlation matrices to identify which variables move in the same direction. 
The higher the values in the matrix, the more similar the variation of the variables.
Conversely, the more negative the values are, the more opposite their variations are.
This makes it easier to study relationships between variables.

<img width="600px" src="https://user-images.githubusercontent.com/116463750/227734782-0f7c40f0-ab69-4a15-9772-5b79039753f9.png">
<br><br>
R output of logistic regression : 
<br><br>
<img width="80%" src="https://user-images.githubusercontent.com/116463750/227734825-169b3df1-f7b9-45e4-a5b0-ff60b9fdcec9.png">

## Multivariate Description
----------

Global Box-plot : <br><br>
<img width="600px" src="https://user-images.githubusercontent.com/116463750/227735029-1ca5642c-00e1-47de-8a77-306bb3329adf.png">

In multivariate statistics, a scree plot is a line graph of the principal components. 
The scree plot is used to determine the principal components to keep in a principal component analysis in a principal component analysis (PCA).

<img width="600px" src="https://user-images.githubusercontent.com/116463750/227735039-c583812b-eaff-449c-a067-62e31b768f35.png">

- The Kaiser rule (keep eigenvalues greater than 1 in standard PCA): In our case, the first eigenvalue is 3.71 while the second is 0.94. We would therefore tend to retain the first two axes <br>
- Elbow method which consists in locating the break point where the points and then select the axes to its left. We observe the bend is formed from the second axis. So with this method we must keep the first two axes. <br>
- Rule of thumb: In order for our data to be interpreted, we must not have too many axes, but the cumulative percentage of the Eig values must be sufficient (generally above 70%). This rule requires to keep the first two axes.

### Circle of Correlations

For the analysis of the correlation circle, we are interested in the arrows located far from the center.
Our circle has a center which corresponds to 0 and a maximum radius which is equal to 1.
If one of our variable projections is oriented upwards, it will have a positive correlation coefficient at dimension 1, conversely its value will be negative.
And similarly, if one of our variable projections is oriented to the right, it will have a positive correlation coefficient in dimension 2, inversely its value will be negative. 
The longer the arrow, the more it will have a coefficient close to 1 and will thus be more easily interpreted in relation to the two dimensions.

We also seek to observe a grouping of variables that would be strongly correlated between them. 
If we observe a grouping, we can synthesize them into a single synthetic variable.

<img width="600px" src="https://user-images.githubusercontent.com/116463750/227735200-18ec29e9-e2d7-4ac1-be10-117f70a1527e.png">

### Biplot - Variables and Individuals

<img width="600px" src="https://user-images.githubusercontent.com/116463750/227735205-227bed83-8948-463b-900f-3d8addd28b9b.png">

### Contribution des individus selon les composantes principales

<img width="600px" height="400px" src="https://user-images.githubusercontent.com/116463750/227735207-20fc19d9-55ab-40bd-8882-59a0a643a07a.png">

<img width="600px" src="https://user-images.githubusercontent.com/116463750/227735209-5e987466-2873-492f-aed5-8f5a0bdc277c.png">

### Contribution of the variables according to the principal components

<img width="500px" src="https://user-images.githubusercontent.com/116463750/227735212-2875dbdd-2de6-42f6-8619-ab89c3652a18.png"> <img width="500px" src="https://user-images.githubusercontent.com/116463750/227735214-d5a7f6df-be20-4f46-8843-f5c76eaee28d.png">

### Optimal number of clusters (Elbow, Silhouette and Gap Statistic method)

<img width="400px" src="https://user-images.githubusercontent.com/116463750/227735219-860863af-eac2-4b62-b1d2-58fd0c7c82d5.png"> <img width="400px" src="https://user-images.githubusercontent.com/116463750/227735220-9723ff6e-72dd-4187-a688-49cc37998604.png"> 

<img width="400px" src="https://user-images.githubusercontent.com/116463750/227735224-fe1cfb49-aeca-4759-a6dd-3063fbd792eb.png">

### Cluster Dendogram

<img width="600px" src="https://user-images.githubusercontent.com/116463750/227735227-31536693-2bc3-4b33-8fdc-698ad5e94474.png">

### Cluster Plot

<img width="600px" src="https://user-images.githubusercontent.com/116463750/227735230-dad1126c-9478-435d-a392-7312f8309949.png">

<img width="600px" src="https://user-images.githubusercontent.com/116463750/227735232-73e48358-9a36-4f3c-8807-8058df1fa727.png">
</div>
