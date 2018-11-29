library(ggplot2)
# Set working directory, put the path to the folder containing your files inbetween the inverted commas
setwd("./")
#Import your data, save it as a csv in excel with the column headings cores, runtime, error
df <- read.csv("speedup.csv", sep=",", header=TRUE)

# Line plot with error bar
p <- ggplot(df, aes(x=df$cores, y=df$runtime)) + 
     geom_errorbar(aes(ymin=df$runtime - df$error, ymax=df$runmax), width=.9, 
     position=position_dodge(0.05), colour="gray45") +
     geom_line(color="black") + geom_point() +
     theme_bw() +
     # Specify axis labels
     labs(x = "# of cores", y = "runtime for 1000 steps (s)")


# Save file and scale axis
ggsave("speedup.pdf",p)
