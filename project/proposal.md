## Data Source
EMails downloaded by me.

## Analysis Workflow
My project is Phishing Detection, in which we are using a multi-faceted approach to find out if the email messages (or any text with metadata). The part I want to use HPC is creating a Neural Network model of URLs and headers.
 
I want to build the project from start to finish. 
The Emails are downloaded from Gmail (author's emails for training (nearly 5 GB of emails).
First the emails are downloaded as huge .mbox files, which are broken down to individual emails as .msg files.
Each .msg files has to be scannhed for headers, URLs, body texts. They needed to be indexed and categorized for vectorization.
The URLs are again parased for url attriubtes, and several other attributes online like google index, whois, and many other metadata avaiable online. That takes several minutes for each URL and we have over 3 million URLs in our dataset.
Further, the body texts are to be trained on BERT which is English language data which takes lot of times and require high GPU processing. This takes over an hour for each epoch, and we need over 20 epochs.
Then the final model needs to be trained.
This takes several days in our local laptops to fully build, and we had to run as reduced dataset for our capstone, but I want to run here for full dataset.



## Tools
Python

## Optimizations
1. Regex optmizations
2. BERT and NN tuning for various models. We run 7 model combinations of each.
