library(dplyr)
n_dims<-sample(3:10, 1)

consec<-1:n_dims^2
set.seed(1)
samp<-sample(consec)
mat<-matrix(samp, nrow=sqrt(length(consec)),ncol=sqrt(length(consec)))
print(mat)
t(mat)
mat
last<-mat[length(mat)]

sum<-sum(c(mat[1,],mat[sqrt(length(mat)),]))
mean<-mean(c(mat[1,],mat[sqrt(length(mat)),]))

length(mat)
sqrt(length(mat))
eig<-eigen(mat)
#What kind of numbers are $values and $vectors
#values is a vector containing the p eigenvalues of x in decreasing order 
#vector is a vector of eigenvectors, or right eigenvector

typeof(eig$values)
typeof(eig$vectors)

#2 
rand<-runif(16)
my_matrix<-matrix(rand, nrow=4, ncol=4)
rand_vec<-runif(100)
rand_vec
my_logical<-rand_vec>0.5
my_letters<-sample(letters)
my_list<-list(my_matrix, my_logical,my_letters)
my_list

new_list<-list(my_matrix[2,2],my_logical[2], my_letters[2])

typeof(my_list[my_matrix])

newlist<-list(c(my_matrix[2,2], my_logical[2], my_letters[2]))


#3 
df<-data.frame(my_unis=runif(26,min = 0, max=10), my_letters=sample(LETTERS))
df
df<-replace(df, sample(df), value=NA)
       
df_samp<-sample_n(df,size = 4, replace=TRUE)
df_samp

df_s<-sample(1:26, 4)
df_s
df[df_s,2]

df_replace<-replace(df, my_letters==df[df_s,2], NA)
