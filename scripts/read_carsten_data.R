setwd("~/Documents/Courses/ml_medbioinfo_2020/project/data/Altuna_Carsten_ST")

bc1.df <- read.table("BC1_output_table_ctts.txt", header=T, sep="\t")
bc2.df <- read.table("BC2_output_table_ctts.txt", header=T, sep="\t")
bc3.df <- read.table("BC3_output_table_ctts.txt", header=T, sep="\t")
bc4.df <- read.table("BC4_output_table_ctts.txt", header=T, sep="\t")

exp.vec <- c(rep("exp1", nrow(bc1.df)), 
             rep("exp2", nrow(bc2.df)), 
             rep("exp3", nrow(bc3.df)), 
             rep("exp4", nrow(bc4.df)))

label.vec <- c(row.names(bc1.df), row.names(bc2.df), row.names(bc3.df), row.names(bc4.df))

bc.all.coord.vec <- as.numeric(unlist(strsplit(label.vec,"x")))

bc.all.labels <- data.frame(exp.vec,
                            bc.all.coord.vec[seq(1,length(bc.all.coord.vec)-1,2)], 
                            bc.all.coord.vec[seq(2,length(bc.all.coord.vec),2)]
)
names(bc.all.labels) <- c("experiment", "x", "y")

bc.all.df <- data.frame(bc1.df, 
                        row.names=paste(exp.vec, label.vec, sep="x"))
bc.all.df <- data.frame(rbind(bc1.df, bc2.df, bc3.df, bc4.df), row.names=paste(exp.vec, label.vec, sep="x"))