# Load the required packages
require(ggplot2)
require(ggseqlogo)

# Some sample data
data(ggseqlogo_sample)

ggplot() + geom_logo(seqs_dna$MA0001.1)

ggseqlogo( seqs_dna$MA0001.1 )

# Sequences we're going to use for the logo
seqs = seqs_dna$MA0008.1

# Generate the sequence logo
p1 = ggseqlogo(seqs) + theme(axis.text.x = element_blank())

# Make data for sequence alignment
aln = data.frame(
  letter=strsplit("AGATAAGATGATAAAAAGATAAGA", "")[[1]], 
  species = rep(c("a", "b", "c"), each=8),
  x       = rep(1:8, 3)
)
aln$mut = 'no'
aln$mut[ c(2,15,20,23) ] = 'yes'

# Generate the sequence alignment
p2 = ggplot(aln, aes(x, species)) +
  geom_text(aes(label=letter, color=mut, size=mut)) + 
  scale_x_continuous(breaks=1:10, expand = c(0.105, 0)) + xlab('') + 
  scale_color_manual(values=c('black', 'red')) + 
  scale_size_manual(values=c(5, 6)) + 
  theme_logo() + 
  theme(legend.position = 'none', axis.text.x = element_blank()) 

# Generate barplot data
bp_data = data.frame(x=1:8, conservation=sample(1:100, 8))

# Generate barplot data 
p3 = ggplot(bp_data, aes(x, conservation)) +
  geom_bar(stat='identity', fill='grey') + 
  theme_logo() + 
  scale_x_continuous(breaks=1:10, expand = c(0.105, 0)) + 
  xlab('')


# Now combine using cowplot, which ensures the plots are aligned
suppressMessages( require(cowplot) )
plot_grid(p1, p2, p3,  ncol = 1, align = 'v')
