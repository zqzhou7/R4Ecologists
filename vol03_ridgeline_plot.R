#1. loading packages
# install.packages("ggridges")
library(ggridges)
# install.packages("ggplot2")
library(ggplot2)

#2. creat dataframe
df = diamonds[1:100, c("color", "depth")]

#3. plotting using geom_density_ridges() & geom_density_ridges2()
ggplot(df, aes(x = depth, y = color)) +
  geom_density_ridges()
ggplot(df, aes(x = depth, y = color)) +
  geom_density_ridges2()

#4. cutting the tails and change statistical methods
ggplot(df, aes(x = depth, y = color)) +
  geom_density_ridges(rel_min_height = 0.005)

ggplot(df, aes(x = depth, y = color)) +
  geom_density_ridges(rel_min_height = 0.5)

ggplot(df, aes(x = depth, y = color)) +
  geom_density_ridges(scale = 1)

ggplot(df, aes(x = depth, y = color)) +
  geom_density_ridges(scale = 10)

ggplot(df, aes(x = depth, y = color)) +
  geom_density_ridges(stat = "binline")

#5.change colors
ggplot(df, aes(x = depth, y = color)) +
  geom_density_ridges(fill = "lightblue", alpha = 0.5)

ggplot(df, aes(x = depth, y = color)) +
  geom_density_ridges(fill = "white",
                      color = 'blue',
                      linetype = 2,
                      lwd = 1.5)

ggplot(df, aes(x = depth, y = color, fill = color)) +
  geom_density_ridges()

ggplot(df, aes(x = depth, y = color, fill = color)) +
  geom_density_ridges() +
  scale_fill_manual(values = c('red','orange','yellow','green','cyan','blue','purple'))

ggplot(df, aes(x = depth, y = color, fill = stat(x))) +
  geom_density_ridges_gradient() +
  scale_fill_viridis_c(name = "Depth", option = "C")

ggplot(df, aes(x = depth, y = color, fill = stat(quantile))) +
  stat_density_ridges(quantile_lines = FALSE,
                      calc_ecdf = TRUE,
                      geom = "density_ridges_gradient") +
  scale_fill_brewer(name = "")

ggplot(df, aes(x = depth, y = color, fill = stat(quantile))) +
  stat_density_ridges(quantile_lines = TRUE,
                      calc_ecdf = TRUE,
                      geom = "density_ridges_gradient",
                      quantiles = c(0.05, 0.95)) +
  scale_fill_manual(name = "Prob.", values = c("#E2FFF2", "white", "#B0E0E6"),
                    labels = c("(0, 5%]", "(5%, 95%]", "(95%, 1]"))
