## XXXXX


library(RSelenium)
library(rvest)
library(tidyverse)
library(dplyr)


waitTime <- function(x){
  p1 <- proc.time()
  Sys.sleep(x)
  proc.time() - p1 # The cpu usage should be negligible
}

browser <- remoteDriver(port = 5556)
# open chrome browser
remDr <- remoteDriver(
  remoteServerAddr = "localhost",
  port = 5556,
  browserName = "chrome")
remDr$open()
# navigate to the website
remDr$navigate("https://www.metrocuadrado.com/")

waitTime(5)

###### Fill basic conditions ######

houseType <- remDr$findElement(using = 'xpath', value = '//*[contains(concat( " ", @class, " " ), concat( " ", "css-1hwfws3", " " ))]')
houseType$clickElement()

## Seleccionar apartamento en tipo de propiedad
web.elem <- remDr$findElements('xpath', '//*[@id="propertyTypes"]/div[1]/div[2]')[[1]]$clickElement()
waitTime(1.5)
web.elem <- remDr$findElements('xpath', '//*[@id="react-select-2-option-0"]')[[1]]$clickElement()
waitTime(1.5)
## Tipo de negocio (Compra nuevo y usado)
web.elem <- remDr$findElements('xpath', '//*[@id="businessType"]/div/div[2]')[[1]]$clickElement()
waitTime(1.5)
web.elem <- remDr$findElements('xpath', '//*[@id="react-select-3-option-2"]')[[1]]$clickElement()
waitTime(1.5)
## Sector de la ciudad (Futuro Loop)

##### web.elem <- remDr$findElements('xpath', '//*[@id="formSearch"]/div/div[1]/div/div[3]/div/div/div/input')[[1]]$clickElement()
 
FROM <- remDr$findElement(using = "xpath", value= '//*[@id="formSearch"]/div/div[1]/div/div[3]/div/div/div/input')$sendKeysToElement(list("Cedritos Bogota"))
waitTime(1.5)
web.elem <- remDr$findElements(using = "xpath", value= '//*[@id="btnSearch"]')[[1]]$clickElement()
waitTime(1.5)
### Organizar resultados por precio

web.elem <- remDr$findElements(using = "xpath", value= '//*[@id="__next"]/div/div/div[2]/div[2]/div[1]/div[2]/ul/li/form/div/div/div/div[2]/div')[[1]]$clickElement()
waitTime(1.5)
web.elem <- remDr$findElements(using = "xpath", value= '//*[@id="react-select-4-option-1"]')[[1]]$clickElement()

### Filtrar precios 
FROM <- remDr$findElement(using = "xpath", value= '//*[@id="__next"]/div/div/div[2]/div[2]/div[2]/div[1]/div[1]/div/form/form/div[1]/input')$sendKeysToElement(list("190000000"))
waitTime(1.5)
FROM <- remDr$findElement(using = "xpath", value= '//*[@id="__next"]/div/div/div[2]/div[2]/div[2]/div[1]/div[1]/div/form/form/div[2]/input')$sendKeysToElement(list("300000000"))
waitTime(1.5)
web.elem <- remDr$findElements(using = "xpath", value= '//*[@id="filter-price"]')[[1]]$clickElement()

