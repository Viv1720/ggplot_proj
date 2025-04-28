library(ggResidpanel)
str(ggResidpanel::penguins)

# Fit a model
penguin_model <- lme4::lmer(heartrate ~ depth + duration + (1|bird), data = ggResidpanel::penguins)

# Create the default panel of plots
resid_panel(penguin_model)

# Create an interactive panel of the default diagnostic plots
resid_interact(penguin_model)

# Create a panel of plots of the residuals versus the predictor variables
resid_xpanel(penguin_model, jitter.width = 0.1)
