## What the slides are supposed to get across

* document classification is when the whole document shares the same single category
* often you want to know the proportions of document on particular topics, e.g. policy agenda
* there are discriminative and generative approaches to the problem of assigning that category
* discriminative approaches need to be careful because the problem is ill-posed: V>>N
* ideally we want probabilities rather than outright category decisions
* the basic steps are to construct a training, validation, and test set
* naive bayes is an instructive generative model because it learns both what words do the work and which documents go in which category
* it's a simple application of bayes theorem
* each word count pushes the document towards being in one or other category
* we evaluate document classifiers with precision and recall, just like ca dictionaries...
* we can also use maxent as a discriminative classifier
* this is only trying to learn a decision boundary, so is more efficient than naive bayes

## What the lab is trying to get across

* topic models are things you really do
* document classification is something that you can really do


## Notes

Commented out at the bottom of the lab is an R-based `topicmodels` example.
It's a bit clunky, but could be used.
