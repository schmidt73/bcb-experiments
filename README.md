## Motivation

I have spent much of this summer running informal experiments to test 
certain hypothesis concerning the DREAM module identification challenge.
Simply put, my goal is to find better ways to run the methods
developed in the DREAM challenge and give that answer to the biologists
that will run our methods. 

To give some context, here are some of the questions I have looked at:

- Do we pre-process our PPI network before clustering it to find similar proteins? 
- Is it better to find more or less modules in a biological networks? 
- How large should the modules we find in these biological networks be? How small?
- How similar are the modules output by different algorithms?
- What is the best way to score the significance of biological modules? How  
  do we know which modules are good and which are junk?

To answer these questions we perform experiments. This involves tuning parameters, 
setting up pipelines, writing new scripts, modifying old scripts, and general "hackery". 
Individually, each task is not too complex. However, I will show that this soon
gets unwieldy.

For example, suppose we want to test if the number of clusters 
output in some clustering algorithm affects the significance of the clusters we find.
To test our hypothesis we will run some clustering algorithm and set it to output k = 5 clusters 
and compare the results to that same algorithm ran with k = 10 clusters. For the sake
of this example we have some oracle that can perfectly decide the signficance of our clusters
(though this is never the case with biological data).

Now at the start of the summer I would have ran this experiment in a straightforward way,
though I wouldn't have defined it formally (or at all). It would have gone as follows.
First, write a python script to convert the biological network into a format
that the clustering algorithm can understand. Hand it over the the clustering
algorithm with the correct parameters (k = 5 and k = 10) and save the 
output clusters into two files: clusters\_5.out and clusters\_10.out. Then to
test the hypothesis, give the cluster files to the oracle, get two significance values,
and report back with the results to my professor.

Notice that even though this was the simplest experiment imaginable, there
were still many variables we had to decide upon: the names of the clustering algorithm
outputs, their location (on the filesystem), how to hand cluster files to the oracle, 
and the location of oracle's results. That list is non-exhaustive.
  
Eventually, things got tricky. I have hundreds of different files in 
dozens of directories from multitudes of experiments with long names 
representing the experiment that they came from. A file called
3\_1000\_0.07\_ggc\_20\_deanonmyized meant the result of performing
spectral clustering on the diffusion state distance matrix of our third
network with k = 1000 initial clusters after pruning all edges with
weight less than 0.07 and then using a greedy merging method to merge
the clusters output by another clustering algorithm called genecentric
ran with k = 20 spectral clusters. Oh and I forgot to mention that this was the
deanonymized version of the clusters, node names were represented by gene names (HER2)
instead of a arbitrary number (73). 

At this point I decided something needs to change. 

## Who Cares?

One response to my long rant is: who cares! I was unorganized and
did a poor job managing my work. I'm an idiot. This might have been the case, but
I'm not the only one who made this mistake.

I work in the bioinformatics group at Tufts University under Professor Lenore
Cowen. Most of the work we do involves coming up with novel ways to glean 
information from biological data. Now, I'm just an undergraduate so 
my job is implementation rather than innovation, but that doesn't matter.

Part of the issue is that we believe our job is to invent new algorithms
and methods. We tinker with ideas, write code to implement them, rapidly
prototype, and leave litte documentation. When the time comes to write a 
paper on our research, we spend time going back and figuring out what
we did, wrapping it up nicely so others can understand.

We make the job harder on ourselves because we have to backtrack and remember
what we did in order to share our results with the world. Further, 
the state of affairs for those building on previous work is horrendous - all they 
have is the beginning and end. The other issue is sharing our results when we are currently 
working on some idea and need feedback. And the main issue, which I faced, is organizing results
when working on a large project. That is, keeping track of what worked, what didn't, 
and everything in between.

I want it to be easier than this.

## The Intuition

The aha! moment occurred when I realized that we were running 
many smaller experiments.  This isn't too profound, but naming 
phenomena is a requirement to understanding it. 

Now, I don't want to impose too much structure on the way that we do research.
I believe that rapid iteration is necessary when developing new ideas. Hacking
scripts together should defintely be allowed. But I also want us to remember! 
Forgetting everything we did and only holding onto the result is not useful.

So my proposal balances structure and freedom in a way that I hope is useful.
Note that this is only my first attempt to manage complexity and is not yet
tested.  

## The Idea

The idea is to adapt the standard notion of the scientific method to 
our use case, that of bioinformatics. Essentially, instead of writing
one large paper that describes our results. We should break it up
into smaller logical pieces that all contribute to our end goal.

Obviously this isn't ideal for every type of paper one writes. But
for a lot the work we do, I believe that following this general
guideline will be extremely helpful.

#### Step 1

Create a new directory somewhere, anywhere. This should contain most of what
anyone will need to know about your experiment. Preferably put it into
a git repository of experiments so that it is easy to share with others.

An example structure with a bunch of experiments for a certain
project could look something like this:

```
CurrentProject
|   .git
|   README.md
|
|---Experiment1
|   |   README.md
|   |   ...
|
|---Experiment2
|   |   README.md
|   |   ...
|
|   ...
```

#### Step 2

Formalize your question(s) into a set of testable hypotheses. Define the 
inputs and outputs that you expect from the experiment. Note the types of files 
that will come in/out and what they represent. Note how you plan to
perform your experiment.

Now write it all down in a README.md file at the root of your experiment directory.
Come back to this file during your experiment if anything changes. This is the
*key* to organizing your project.

Gather all the inputs that you plan to use and place them somewhere inside
this directory. Remember to document where they are and what they mean.
   
#### Step 3

Write the code, run your tests, hack things together, and gather results
into your experiment file.

Ideally, document as much of this process as possible, but don't worry too
much. The main goal is to document your inputs, outputs, and how you went from
input to output. You don't need to include every piece of code even. Just
describe what you did.

#### Step 4

Wrap it all up together. Ensure all the outputs are documented and that
one can follow what you have done. That they understand the significance
of the results.

In a sense, this has been what we have been doing all along, but on a more
granular level. Instead of writing a whole paper as one large experiment,
we break it up into these smaller logical parts that are easier to understand.

#### Step 5

Zip it up or link to the git repository. Get feedback, reiterate and move
on.

# Example

Let this directory contain the remainder of the experiments that I perform
this summer. They will serve as an example of this method for future
students working with Professor Cowen and as a useful place for me to
store my results.
