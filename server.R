f<-function(grayim){
  library(EBImage)
  library(readr)
  library(h2o)
  train<-read_csv("data/traindataset.csv")
  localH2O = h2o.init()
  localH2O = h2o.init(max_mem_size = '6g',nthreads = -1) 
  train[,1] = as.factor(train[,1])
  train_h2o = as.h2o(train)
  model =
    h2o.deeplearning(x = 2:785,y = 1,training_frame = train_h2o,activation = "RectifierWithDropout",input_dropout_ratio = 0.2,
                     hidden_dropout_ratios = c(0.5,0.5),
                     balance_classes = TRUE, 
                     hidden = c(100,100),
                     momentum_stable = 0.99,
                     nesterov_accelerated_gradient = T,
                     epochs = 15,quiet_mode = TRUE)
  
  
  m = matrix(unlist(grayim),nrow = 1,byrow = T)
  m<-as.data.frame(m)
  col<-c()
  for(i in 0:784){
    col[i]<-paste("pixel",i,sep="")
  }
  colnames(m)<-col
  
  test_h2o = as.h2o(m)
  h2o_y_test <- h2o.predict(model, test_h2o)
  df_y_test = as.data.frame(h2o_y_test)
  return (df_y_test[1,1])
}

library(shiny)
library(EBImage)
shinyServer(function(input, output) {
  data<-reactive({
    file1<-input$inimage
    if(is.null(file1)){return()}
    else
    {
    img<-readImage(input$inimage$datapath,type="PNG")
    value<-f(channel(img,"gray"))
    value
      }
  })
   
   output$number<-renderPrint({
     if(is.null(data())) print("Select file")
     else
       data()})
    
  })
  

> for(i in ressubmit1$VisitNumber){
  +     restemp<-cbind(restemp,colMeans(ressubmit1[ressubmit1$VisitNumber==i,]))
  +     
    + }