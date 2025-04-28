library(ggspectra)
autoplot(sun.spct)

autoplot(sun.spct, annotations = c("+", "title:where:when"), unit.out = "photon")

ggplot(sun.spct, unit.out = "photon") +
  geom_spct() +
  scale_y_s.q.irrad_continuous() +
  scale_x_wl_continuous(sec.axis = sec_axis_w_number()) +
  theme_bw()
