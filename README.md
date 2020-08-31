# ml-course-project

Repo for the 2020 Machine Learning in Medical Bioinformatics individual course project assignment.  
  
  
## Description
In this project, the aim was to apply various machine learning (ML) methods to a dataset of choice and evaluate their performance. As I work with spatial transcriptomics (ST) in my PhD studies, I decided to use such datasets for this project. The workload was supposed to correspond to roughly one week of work.  

For this project, I have chosen to apply ML to a set of breast cancer ST datasets where each data point (“spot”) has been annotated as either cancer or healthy, and using ML to see whether I can predict these labels using only the gene expression data.
  
  
## Code
All the code in Python 3 using Jupyter Notebook, and the ML methods were aquired from scikit-learn. A conda environment was set up for this project and the environment can be installed using the `envirronment.yml` file.  
  

## Data
I was given access to data produced within our research group (https://www.spatialresearch.org/) containing several ST datasets from breast cancer tissue sections. The data is part of a preprint by Alma Andersson et al.[ref.] and is also available on GitHub https://github.com/almaan/her2st.  
  
[ref] Andersson A et al., “Spatial Deconvolution of HER2-positive Breast Tumors Reveals Novel Intercellular Relationships”, BioRxiv, 2020 https://www.biorxiv.org/content/10.1101/2020.07.14.200600v1.full.pdf
  
  
## The project

### Data processing  

Filtering and normalization of the data was performed using the Scanpy python module, which is designed for single-cell RNA-seq data but can largely be applied to ST data as well. https://scanpy.readthedocs.io/en/stable/

The normalized expression values were scaled (min-max) and only genes that showed the greatest variance across observation were selected for training. The labels used for predictions were binarized into either healthy (0) or cancer (1).  

Out of the total 8 datasets (samples), 5 of them were selected for training and validation and the last 3 were used for testing.  
  

### Algorithms and evaluation

The binary classification ML models selected for evaluation were: Random forest, SVM, K nearest neighbor, linear regression, and gaussian naive-bayes.  
  
Training and validation of all models was done using leave-one-group-out cross validation, where one groups corresponds to data from one sample. Evaluation metrics used for all models were F1 score, accuracy, Matthews correlation coefficient, and ROC AUC.
  
  
### Final model and testing

I selected a random forest model as the final model and trained it using all the training data.The final model is saved as `model_rf.joblib` in the results folder. Thereafter it was tested using test data from one sample at the time. The performance of the model different greatly between samples ranging from an MCC of 0.8 down to 0.2.


## Contact  
Lovisa Franzén [lovisa.franzen@scilifelab.se]
