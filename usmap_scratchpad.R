library(tidyverse)
library(usmap)

# https://cran.r-project.org/web/packages/usmap/readme/README.html
# https://cran.r-project.org/web/packages/usmap/vignettes/mapping.html


# inspect built-in statepop data
statepop

# example
plot_usmap(data = statepop, values = "pop_2015", color = "red") + 
        scale_fill_continuous(name = "Population (2015)", label = scales::comma) + 
        theme(legend.position = "right")

# example
plot_usmap(data = statepop, values = "pop_2015", color = "red") + 
        scale_fill_continuous(
                low = "white", high = "red", name = "Population (2015)", label = scales::comma
        ) + theme(legend.position = "right")

# example
plot_usmap(
        data = statepop, values = "pop_2015", include = c("CA", "ID", "NV", "OR", "WA"), color = "red"
) + 
        scale_fill_continuous(
                low = "white", high = "red", name = "Population (2015)", label = scales::comma
        ) + 
        labs(title = "Western US States", subtitle = "These are the states in the Pacific Timezone.") +
        theme(legend.position = "right")

# built-in regions
usmap::plot_usmap(include = .south_region)

# with counties
plot_usmap("counties", fill = "yellow", alpha = 0.25,
           # 06065 = Riverside County, CA
           include = c(.south_region, "IA", "06065"),
           # 12 = FL, 48141 = El Paso County, TX
           exclude = c(.east_south_central, "12", "48141"))

# inspect map data
us_map() %>% head()
us_map(regions = "counties") %>% head()
