# https://easystats.github.io/see/articles/bayestestR.html#bayes-factors-bfs


#--------------------------------------------------------------------------------------
# Probability of Direction
plot(pds)+
  scale_fill_manual(values=c("#FFC107", "#E91E63"))+
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "italic"))


plot(p_direction(model, priors=FALSE))

#--------------------------------------------------------------------------------------
# Significance testing with ROPE
ropetest=rope(Thesis_Model,range = c(-0.181,0.181), ci=0.89, ci_method = "HDI")

result <- equivalence_test(Thesis_Model)
plot(result)

#openGraph(width = 9,height = 6)

#plot(ropetest, rope_color = "grey70")+scale_fill_got_d(option = "white_walkers")

#saveGraph(file = "ROPES",type = "png")

#---------------------------------------------------------------------------------------
#HDI visuals
CIs <- hdi(Thesis_Model, ci = c(0.89))
plot(CIs) + scale_fill_got_d(option = "white_walkers")

#point estimates
result <- point_estimate(Thesis_Model, centrality = c("map"))
result
plot(result, panel = FALSE)[[1]]

#---------------------------------------------------------------------------------------

# Bayes factors for model comparison

#### Bayes factor comparison of models ####
plot(bayesfactor_models(Thesis_Model,discount_model))+
  scale_fill_pizza()+
  labs(title = "Likelihood of each model under the present data",
       caption = "The data collected for this study are 150x more likely (BF=150.075) under a model that has both Discount and PTS, as opposed to a model with Discount alone.")+
  theme(plot.title = element_text(hjust = 0.5))