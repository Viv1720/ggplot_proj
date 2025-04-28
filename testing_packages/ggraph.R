install.packages("ggraph","tidygraph")
library(ggraph)
library(tidygraph)

# Create graph of highschool friendships
graph <- as_tbl_graph(highschool) |> 
  mutate(Popularity = centrality_degree(mode = 'in'))

# plot using ggraph
p <- ggraph(graph, layout = 'kk') + 
  geom_edge_fan(aes(alpha = after_stat(index)), show.legend = FALSE) + 
  geom_node_point(aes(size = Popularity)) + 
  facet_edges(~year) + 
  theme_graph(foreground = 'steelblue', fg_text_colour = 'white') +
  theme_minimal() +
  annotate(geom = "text", x = 0, y = 0, label = "test")

p
class(p)


