

getwd()

movies <- read.csv("Movie-Ratings.csv")

head(movies)

colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")

head(movies)
tail(movies)
str(movies)
summary(movies)

#--------- factoring a numeric variable

#factor(movies$Year)

movies$Year <- factor(movies$Year)

#--------------------------------------

summary(movies)

str(movies)


#--------------------------- Asthetics

library(ggplot2)

ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))


#----------------Add Geometry

ggplot(data = movies, aes(x=CriticRating, y=AudienceRating)) +
  
  geom_point()


# --------------Add color

ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, color= Genre)) +
  
  geom_point()
  
  
#-----------------Add size

ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                          color= Genre, size=Genre)) +
  
  geom_point()
# That does not look good. Let's change the size variable


ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                          color= Genre, size=BudgetMillions)) +
  
  geom_point()


#>>>> This is #1 (We will improve it)



#------------------Plotting with Layers

# Creating an object(the initial plot)

p <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                               color= Genre, size=BudgetMillions))

p 

#point
p + geom_point()

# Line

p + geom_line()

# multiple layers

p + geom_point()+geom_line()

p + geom_line()+geom_point()



#------------Overriding Aesthetics

q <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                               color= Genre, size=BudgetMillions))

q + geom_point()


#Overriding aes

#ex1

q + geom_point(aes(size=CriticRating))


#ex2
q + geom_point(aes(color=BudgetMillions))


# q remains the same

q + geom_point()


#ex3
# Mapping aesthetic
q + geom_point(aes(x=BudgetMillions))+
  
  xlab("Budget Millions $$$$")

#ex4

p + geom_line()+geom_point()


#reduce line size
# setting aesthetic
p + geom_line(size=1)+geom_point()



#----------------Mapping vs Setting------------

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

r + geom_point()


#add color

#1. Mapping (what we have done so far)

r + geom_point(aes(color=Genre))

#2. setting

r + geom_point(color="DarkGreen")

#wrong if we write
r + geom_point(aes(color="DarkGreen"))

#1 Mapping

r + geom_point(aes(size=BudgetMillions))

# setting

r + geom_point(size=10)

#error

# r + geom_point(aes(size=10))




#------------- Histograms and Density Charts


s <- ggplot(data=movies, aes(x=BudgetMillions))

s + geom_histogram(binwidth = 10)


# add color

s + geom_histogram(binwidth = 10, aes(fill=Genre))


# add border

s + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

#>>> 3 (We will improve it)


# sometimes you may need density charts

s + geom_density(aes(fill=Genre))

s + geom_density(aes(fill=Genre), position = "stack")




#--------------------Starting Layer Tips

t <- ggplot(data=movies,aes(x=AudienceRating))

t +geom_histogram(binwidth = 10,fill="White", color="Blue")


# another way(this is better in most cases)

t <- ggplot(data = movies)
t +geom_histogram(binwidth = 10,fill="White",
                  aes(x=AudienceRating),
                  color="Blue")
#>>>>> 4

t +geom_histogram(binwidth = 10, aes(x=CriticRating),
                  
                  fill="White",
                  
                  color="Blue")

#>>>>>> 5




# skelton plot (creates a  new empty plot)

t <- ggplot()




#---------------------------------Statistical Transformation

library(ggplot2)
install.packages(ggplot2)

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             color=Genre))

u + geom_point() +geom_smooth()

u + geom_point() + geom_smooth(fill=NA)


# boxplot

u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             color=Genre))

u +geom_boxplot()

u +geom_boxplot(size=1.2)

u +geom_boxplot(size=1.2) + geom_point()

# tip to fix it

u +geom_boxplot(size=1.2) + geom_jitter()

# another way

u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
#>>>>>>>>>> 6


u <- ggplot(data=movies, aes(x=Genre, y=CriticRating,
                             color=Genre))

u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)



#-------------------------Using facets


v <- ggplot(data=movies, aes(x=BudgetMillions))

v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black")


# facets

v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black") +
  
  facet_grid(Genre~.)



v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black") +
  
  facet_grid(Genre~., scales ="free")



# scatterplot

w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             color=Genre))

w + geom_point(size=3)


# facets

w + geom_point(size=3) +
  
  facet_grid(Genre~.)

w + geom_point(size=3) +
  
  facet_grid(.~Year)


w + geom_point(size=3) +
  
  facet_grid(Genre~Year)


w + geom_point(size=3) +
  
  geom_smooth()+
  
  facet_grid(Genre~Year)


w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth()+
  facet_grid(Genre~Year)

#>>>>>> 1(but will improve it)


#Today

#limits
#zoom



m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             
                             size=BudgetMillions,
                             
                             color=Genre))

m + geom_point()


m + geom_point()+
  
     xlim(50,100)+
  
     ylim(50,100)



# won't work well always


n <- ggplot(data=movies, aes(x=BudgetMillions))

n + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black")

n + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black")+
  ylim(0,50)


# instead -- zoom:


n + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black")+
  coord_cartesian(ylim = c(0,50))

# improve #1


w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth()+
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))



#----------------Perfecting by adding themes

o <- ggplot(data=movies, aes(x=BudgetMillions))

h <- o + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black") 
h


# axes labels

h + xlab("Money Axis")+
  
  ylab("Number of Movies")+
  
  theme(axis.title.x = element_text(color = "Black", size = 30),
        
        axis.title.y = element_text(color = "DarkGreen", size = 30))


# tick mark formatting


h + xlab("Money Axis")+
  
  ylab("Number of Movies")+
  
  theme(axis.title.x = element_text(color = "Black", size = 30),
        
        axis.title.y = element_text(color = "DarkGreen", size = 30),
                                    
        axis.text.x = element_text(size = 20),
        
        axis.text.y = element_text(size = 20))



?theme


# legend formatting

h + xlab("Money Axis")+
  
  ylab("Number of Movies")+
  
  theme(axis.title.x = element_text(color = "Black", size = 30),
        
    axis.title.y = element_text(color = "DarkGreen", size = 30),
        
        axis.text.x = element_text(size = 20),
        
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
    
    legend.position = c(1,1),
    
    legend.justification = c(1,1))


# title

h + xlab("Money Axis")+
  
  ylab("Number of Movies")+
  
  ggtitle("Movie Budget Distribution") +
  
  theme(axis.title.x = element_text(color = "Black", size = 30),
        
        axis.title.y = element_text(color = "DarkGreen", size = 30),
        
        axis.text.x = element_text(size = 20),
        
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        
        legend.position = c(1,1),
        
        legend.justification = c(1,1),
        
        plot.title = element_text(hjust= 0.5, color = "DarkBlue",
        
        size=30, family="Courier"))