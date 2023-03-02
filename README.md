# EDS 240: Data visualization and customization

This is a workshop written for UCSB MEDS Winter 2023, EDS 240 (Data Visualization and Communication) given on 2 March 2023.  

# Libraries

```
# general use
library(tidyverse) # general tidying and visualization: ggplot is loaded by default with tidyverse
library(lterdatasampler) # data we're using comes from this package
library(lubridate) # working with dates
library(here) # folder organization

# extras
library(patchwork) # arranging plots
library(magick) # putting images into ggplots
```

# Code

The code template is [here](https://github.com/an-bui/EDS-240_data-vis-and-customization/blob/main/code/ggplot-code_2023-03-02.qmd) and knitted output is [here](https://an-bui.github.io/EDS-240_data-vis-and-customization/code/ggplot-code_2023-03-02.html).

# Independent work time tasks

For independent work time, you have a few different options:

## a. deconstruct Tidy Tuesday visualizations

**Goal**: understand how `theme` options work and/or explore package add-ons to `ggplot`  

**Task**: recreate Tidy Tuesday visualizations from week 8 [(data on Bob Ross paintings)](https://github.com/rfordatascience/tidytuesday/blob/master/data/2023/2023-02-21/readme.md). Treat this like a puzzle: you know the end result (the image), but all the pieces you have are in disarray (the `theme` tools). Try working backwards from the output to see if you can recreate the plot.

### Option 1: Treemap  

![Treemap by amalasi2418 on github](https://raw.githubusercontent.com/amalasi2418/TidyTuesday/main/2023/w08/bob_ross.png) 

Need some help? Here's [the code](https://github.com/amalasi2418/TidyTuesday/blob/main/2023/w08/bob_ross.R).

### Option 2: Proportional stacked

![Area plot by Antonio Alegría](https://raw.githubusercontent.com/AntonioAlegriaH/TidyTuesdayRepository/main/plot-images/2023-02-21-bob-ross-colors.png)

Need some help? Here's [the code](https://github.com/AntonioAlegriaH/TidyTuesdayRepository/blob/main/tidy_tuesday_2023-02-21-bob_ross_colors.R).  

### Option 3: Proportional symbol

![Plot by Matt Andreotta](https://raw.githubusercontent.com/matt-lab/tidytuesday/main/2023/week_08/plot.png)

Need some help? Here's [the code](https://github.com/matt-lab/tidytuesday/blob/main/2023/week_08/plot.R).

### Option 4: Ordered horizontal bar

![Plot by Martijn van Bloois](https://raw.githubusercontent.com/mvbloois/tidytuesday/main/2023/2023-08/bob-ross-paintings.png)

Need some help? Here's [the code](https://github.com/mvbloois/tidytuesday/blob/main/2023/2023-08/bob-ross-paintings.R).

### Option 5: Donut

![Plot by Ralitza Soultanova](https://raw.githubusercontent.com/RalitzaSoultanova/TidyTuesday2023/main/w8/final_bob_ross_ralitza_soultanova.png)

Need some help? Here's [the code](https://github.com/RalitzaSoultanova/TidyTuesday2023/blob/main/w8/w8_Bob_ross.R).

## b. edit visualizations

**Goal**: improve visualizations from 1 Mar submissions to _convey a message_ (not just showing the data)  

**Task**: revisit the visualizations you submitted and consider two points:  
1) What message am I trying to convey with this figure?  
2) How can I convey that message?  
Sometimes addressing 1) and 2) together mean taking things away (because your figure is too data-dense) or adding things in (because your figure is a map without data on it).  

After you've answered 1) and 2) for yourself, **write them down** and **sketch out the plot** you would make to address both points. **Remake your figure** and **ask someone to tell you what the main message is** (without you telling them what you _think_ it is). It's important that this person _is not in your group and doesn't know the details of your group project._

### Visual vocabulary

You have already learned about different types of plots for different types of data: this is the [Visual Vocabulary](https://public.tableau.com/views/VisualVocabulary/VisualVocabulary?:showVizHome=no). You can also use this [flow chart](https://www.data-to-viz.com/). Additionally, you have learned about visual variables (see lecture slides from 26 Jan).

### Mapping activity

If you're stuck, you can also revisit the [mapping activity](https://docs.google.com/spreadsheets/d/1-RWVs4RqfHJHjvrhBUTuI05iqgVE6RmF_9zAP_Yi-7k/edit) we did in class during week 4. With your group mates, you wrote down the kinds of visualizations you wanted to make and the visual variables you would manipulate in each visualization.

## c. revise evaluation plan and digital mock ups

**Goal**: incorporate feedback into a revised evaluation plan  

**Task**: meet with your group members and **carefully consider** feedback you have received. As with any feedback: if you agree, incorporate it into your plan; if you disagree, add justification (in text or otherwise) for why you do not need to incorporate that feedback _and context_ for why that feedback doesn't apply to you.








