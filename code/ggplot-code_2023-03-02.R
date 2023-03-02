#####################################################-
# 1. libraries and other set up ----------------------
#####################################################-

# general use
library(tidyverse) # general tidying and visualization: ggplot is loaded by default with tidyverse
library(lterdatasampler) # data we're using comes from this package
library(lubridate) # working with dates
library(here) # folder organization

# extras
library(patchwork) # arranging plots
library(magick) # putting images into ggplots

# palette
site_palette <- c("BC" = "#687f47", "CC" = "#268e86", "CT" = "#373f1f", 
                  "DB" = "#03010a", "GTM" = "#447c49", "JC" = "#2e2747", 
                  "NB" = "#7f696a", "NIB" = "#777a76", "PIE" = "#a87445", 
                  "RC" = "#aef23a", "SI" = "#e05357", "VCR" = "#087f0c", 
                  "ZI" = "#010201")

#####################################################-
# 2. data adjustment ---------------------------------
#####################################################-

crab_data <- pie_crab %>% 
  # extracting month from the date column using lubridate::month()
  # also making this a factor (instead of numeric) using as.factor()
  mutate(month = as.factor(month(date)))

#####################################################-
# 3. ggplot defaults ---------------------------------
#####################################################-

# ⊣ a. scatter plot ----------------------------------

ggplot(data = crab_data, aes(x = latitude, y = size)) +
  # putting the aesthetics in here: color points by site, shape points by month
  geom_point(aes(color = site, shape = month),
              # anything that doesn't have to do with variables (like point size or transparency) goes outside the aesthetics
              size = 3, alpha = 0.6) +
  # facet by month
  facet_wrap(~month)

# ⊣ b. some other plot -------------------------------

ggplot(data = crab_data, aes(x = size)) +
  geom_density(aes(fill = site), alpha = 0.2)

# ⊣ c. another plot ----------------------------------

ggplot(data = crab_data, aes(x = latitude, y = size)) +
  geom_violin(aes(fill = site))

#####################################################-
# 4. theme customization -----------------------------
#####################################################-

crab_plot <- ggplot(data = crab_data, aes(x = latitude, y = size)) +
  geom_point(aes(color = site, shape = month), size = 3, alpha = 0.6) +
  facet_wrap(~ month) +
  
  # scaling
  # change point colors and assign each to a site
  scale_color_manual(values = site_palette) +
  # change the point shapes
  scale_shape_manual(values = c("7" = 21, "8" = 18)) +
  # change the x and y axis limits and breaks
  scale_x_continuous(limits = c(29, 45)) +
  scale_y_continuous(n.breaks = 10) +
  
  # theme() call
  theme(
    # panel: everything having to do with the main plotting area
    panel.background = element_rect(fill = '#B5C7F4', color = '#F761F9', linewidth = 5),
    panel.border = element_rect(fill = NA, color = "#87Bf18", linewidth = 2),
    panel.grid.major.x = element_line(color = "#FF21E1", linetype = 6),
    panel.grid.minor.x = element_line(color = "#2D65BF", linetype = 4),
    panel.grid.minor.y = element_blank()
  ) +
  # another theme() call: you don't have to split things up like this 
  # just doing it for ease of demonstration
  theme(
    # plot: anything having to do with the area around the panel
    plot.background = element_rect(fill = "#98FC6A"),
    plot.title = element_text(size = 30, hjust = 0.25, family = "Helvetica"),
    plot.subtitle = element_text(size = 20, hjust = 0.75, color = "#2A23A3", family = "Times New Roman"),
    plot.caption = element_text(size = 10, angle = 25, family = "Comic Sans MS"),
    plot.margin = unit(c(1, 4, 1, 3), "cm")
  ) +
  theme(
    # axes: anything having to do with the x and y axis
    axis.title.x = element_text(face = "bold.italic", color = "#9254D3"),
    axis.title.y = element_text(family = "Arial", face = "bold", size = 20, hjust = 0.25),
    axis.text = element_text(face = "italic", size = 15),
    # note that axis.text options from above are inherited
    axis.text.x.bottom = element_text(angle = 180)
  ) +
  theme(
    # strips: anything having to do with facet titles
    strip.background = element_rect(fill = "#C9E886"),
    strip.text = element_text(color = "#854EED", family = "Garamond", face = "bold")
  ) +
  theme(
    # legend: anything having to do with legend
    legend.background = element_rect(fill = "#DC86E8"), 
    legend.key = element_rect(fill = "#C2F774"),
    legend.direction = "horizontal",
    legend.position = "top",
    legend.justification = "left",
    legend.title = element_text(family = "serif", color = "#B452F9"),
    legend.text = element_text(color = "#30F92C", family = "mono")
  ) +
  
  # making annotation with "big gap"
  annotate(geom = "text", x = 32, y = 20, label = "big gap", color = "#CC107D") +
  
  # labs: anything having to do with labels
  labs(title = "Crabs!",
       subtitle = "I love crabs",
       x = "Latitude (low to high)",
       y = "Size (small to big)",
       caption = "Do you love crabs?",
       col = "I love colors!") 

crab_plot

#####################################################-
# 5. multipanel plots --------------------------------
#####################################################-

# for a histogram, you don't need y in your aesthetic call
crab_hist <- ggplot(crab_data, aes(x = size)) +
  # telling ggplot that you want to plot a histogram
  geom_histogram(binwidth = 1, aes(fill = site)) +
  # some scaling
  scale_x_continuous(breaks = seq(from = 6.5, to = 24.5, by = 1)) +
  scale_y_continuous(limits = c(0, 45), expand = c(0, 0)) +
  scale_fill_manual(values = c("BC" = "#7D9084", "CC" = "#8B9FD9", "CT" = "#DDD5D5", 
                               "DB" = "#CADDA5", "GTM" = "#DF697F", "JC" = "#E09E5F", 
                               "NB" = "#7F56DB", "NIB" = "#D8DF5D", "PIE" = "#DC53D3", 
                               "RC" = "#84D9DF", "SI" = "#D798D1", "VCR" = "#77E2A8", 
                               "ZI" = "#76E762")) +
  # some theme-ing
  theme(
    panel.background = element_rect(fill = '#B6E45F', color = '#DABA84', linewidth = 5),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(color = "#E16B86", linetype = 2),
    panel.grid.minor.y = element_line(color = "#B49CD2", linetype = 3),
    legend.background = element_rect(fill = "#A0C8E8"),
    plot.background = element_rect(fill = "#8ADDA8"),
    plot.title = element_text(size = 20),
    plot.margin = unit(c(1, 4, 1, 3), "cm")
  ) +
  # some labeling
  labs(x = "Crab sizes (small to big)",
       y = "Number of crabs (few to lots)",
       title = "This is a crab histogram",
       fill = "Places") +
  # adding the crab image
  annotation_raster(crab_image, xmin = 8, xmax = 10, ymin = 30, ymax = 35) +
  # annotating the plot with the photographer credit
  annotate(geom = "text", x = 9, y = 29, label = "PWhittle, iNaturalist", size = 3)

crab_hist

# this automatically recognizes that you're putting plots together (no function call!)
crab_plots_together <- crab_plot + crab_hist + 
  
  # plot_layout: anything having to do with the way plots are arranged
  # widths takes a ratio: the panel ratio will be 2:1 left:right
  plot_layout(widths = c(2, 1)) + 
  
  # plot_annotation: anything having to do with annotations
  plot_annotation(tag_levels = "A", tag_suffix = ")") & # annotating them with panel letters
  
  # patchwork has its own theme options!
  theme(plot.tag = element_text(size = 40)) # changing the size of the annotations

# display our beautiful plot  
crab_plots_together

