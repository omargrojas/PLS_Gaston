# Partial Least Squares Path Modeling

# PLS-PM is the Partial Least Squares approach to Structural Equation Modeling. 
# PLS-PM is a statistical method for studying complex multivariate relationships
# among observed and latent variables. PLS-PM is a data analysis approach for
# studying a set of blocks of observed variables in which each block can be
# summarized by a latent variable and that linear relations exist between latent
# variables

# PLS Path Modeling quantifies the relationships by considering the network as a
# system of multiple interconnected linear regressions

# load package 'plspm' 
library("plspm")

# asking for help about function plspm
help(plspm)

# Case study: Index of Success using data of Spanish pro- fessional football teams.

# load data spainfoot
data(spainfoot)

# first 5 rows of spainfoot
head(spainfoot, n = 5)

# One of the most common applications of PLS Path Modeling is the calculation of
# indices to quantify some key concept or notion of importance Common PLS
# examples of indices may include Index of Satisfaction, Index of Motivation,
# Index of Usability, or in our case an Index of Success.

# Admittedly, some- times we must face the fact that the variables of interest
# in our models cannot be observed nor measured directly. These concepts receive
# the special name of latent variables but they are also known as constructs,
# composites, hypothetical variables, theoretical concepts, intangibles, and
# factors.

# Example A marketing manager proposes new return policies to increase customer satisfaction.

# The marketing manager believes that changing the actual product return
# policies will meet customers’ needs, who, in turn, are expected to be more
# satisfied

# Toy model: the better the quality of the Attack, as well as the quality of the Defense, the more Success

# Success = f(Attack, Defense)
# Success = b_1 Attack + b_2 Defense

# Manifest variables: To make them operative, latent variables are indirectly
# measured by means of variables which can be perfectly observed-measured. These
# types of variables are called manifest variables (MVs), also known as
# indicators or items. We assume that manifest variables contain information
# that reflect or indicate one aspect of the construct; hence we use the
# information contained in indicators to obtain an approximate representation of
# the latent variable.

#Latent variables can be measured in two ways: 
#• through their consequences or effects reflected on their indicators 
# • through different indicators that areassumed to cause the latent variables 
#In the first case, called reflective way,
#manifest variables are considered as being caused by the latent variables. The
#second case is known as formative way because the latent construct is supposed
#to be formed by its indicators

#A full path model is comprised by two submodels: the structural model also 
#known as inner model and the measurement model also known as outer model. The 
#inner model is the part of the model that has to do with the relationships 
#between latent variables. The outer model is the part of the model that has to
#do with the relationships between each latent variable and its block of
#indicators

# rows of the inner model matrix
Attack = c(0, 0, 0)
Defense = c(0, 0, 0)
Success = c(1, 1, 0)

# matrix created by row binding
foot_inner = rbind(Attack, Defense, Success)

# add column names (optional)
colnames(foot_inner) = rownames(foot_inner)

# plot the inner matrix
innerplot(foot_inner)

# define list of indicators: what variables are associated with what latent variables
foot_outer = list(1:4, 5:8, 9:12)

# all latent variables are measured in a reflective way
foot_modes = c("A", "A", "A")

# plspm(Data, inner matrix, outer list, modes)

# run plspm analysis
foot_pls = plspm(spainfoot, foot_inner, foot_outer, foot_modes)






