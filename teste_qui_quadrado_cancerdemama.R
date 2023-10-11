#QUI-QUADRADO VARIÁVEIS CATEGÓRICAS

#PACOTES
pacman::p_load(data.table, ggplot2, corrplot)

#BASE DE DADOS
breast_cancer <- fread('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/breast_cancer.csv', stringsAsFactors = T)

#TABELA DE CONTIGÊNCIA tamanho tumor x idade
breast_cancer_table <- table(breast_cancer$idade, breast_cancer$tumor_tamanho)
breast_cancer_table


#GRÁFICOS DE DISPERSÃO tamanho tumor x idade 
ggplot(breast_cancer) + aes(x = tumor_tamanho, fill = idade) + geom_bar(position = "fill")


#TESTE QUI QUADRADO tamanho tumor x idade
breast_cancer_test <- chisq.test(breast_cancer_table)
breast_cancer_test
breast_cancer_test$observed
breast_cancer_test$expected

#CORRPLOT DAS VARIÁVEIS tamanho tumor x idade
corrplot(breast_cancer_test$residuals, is.cor = FALSE)
