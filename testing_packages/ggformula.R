suppressPackageStartupMessages(library(ggformula))
data(penguins, package = "palmerpenguins")
penguins |> 
  set_variable_labels(
    bill_length_mm = "bill length (mm)",
    bill_depth_mm = "bill depth (mm)"
  ) |>
  gf_jitter(bill_length_mm ~ bill_depth_mm | island ~ sex, color = ~ species,
            width = 0.05, height = 0.05, size = 0.5, alpha = 0.6) |>
  gf_density2d(alpha = 0.3) |>
  gf_labs(title = "Palmer Penguins",
          caption = "Data available in palmerpenguins package"
  ) |>
  gf_refine(scale_color_brewer(type = "qual")) |>
  gf_theme(theme_bw()) |>
  gf_theme(
    legend.position = 'top',
    text = element_text(colour = "navy", face = "italic")
  ) +
  geom_point() +
  annotate(geom = "text", x = 17.5, y = 50, label = "test")


#> Warning: Removed 2 rows containing non-finite values (`stat_density2d()`).
#> Warning: Computation failed in `stat_density2d()`
#> Caused by error in `if (any(h <= 0)) ...`:
#> ! missing value where TRUE/FALSE needed
#> Warning: Removed 2 rows containing missing values (`geom_point()`).

