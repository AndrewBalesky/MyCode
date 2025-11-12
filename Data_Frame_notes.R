text=c("boom", "Shaka", "laka")
text
names(text)= c("Word1", "Word2", "Word3")

a_vector=1:9
a_matrix=matrix(a_vector, nrow=3)
a_matrix
row_names=c("A","B","C")
col_names=c("X","Y","Z")
dimnames(a_matrix)<-list(row_names,col_names)
a_matrix [3,3]
a_matrix [,3]

year_group<-c("Freshmen","Junior","Junior","Senior","Sophmore")
class(year_group)
factor_year_group<-factor(year_group)
factor_year_group
factor_year_group<-factor(year_group,ordered =TRUE,levels=c("Freshmen","Sophmore","Junior","Senior"))
factor_year_group

nv<-c(1,3,6,8)
cv<-c("a","b","c","d")
lv<-c(TRUE,FALSE,FALSE,TRUE)
DF1<-data.frame(nv,cv,lv)
DF1
DF1$cv[2]
DF1[1:2,1:2]

num_vec<-c(13,17,1, 31,45)
order(num_vec)
num_vec[order(num_vec)]
ChickWeight[order(ChickWeight$Diet, ChickWeight$weight)]
head(ChickWeight[order(ChickWeight$Time,ChickWeight$weight)])
