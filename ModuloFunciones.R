

get_weather_data <- function() {
  
leerDatos<-suppressWarnings({fread('C:/R_ejerc/EstacionCATIE/catie_Horarios.dat', sep=',')})[-c(1:3),]
nombres<-c('Fecha', 'Record','CodEstación','Temp', 'HR', 'RadGlobMax','RadGlobMin','RadGlobTot','MinHorasLuz', 'Lluvia',
           'FrecViento', 'DirPromViento', 'VientoPromEscalar', 'VientoVectorial', 'DireccionViento', 'SDDirViento', 'V1','V2',
           'TempRocioProm', 'TensionVaporSatProm', 'V3','V4','V5', 'SDTemp', 'SDHR', 'SDVviento', 'V6','V7', 'V8','V9', 
           'VelMaxViento', 'V10', 'V11','DenFlujoPARProm', 'FlujoTotPAR', 'SensaTermiMax', 'SensaTermiMin', 'RadSol', 'NtanqueEvapotrans')
colnames(leerDatos)<-nombres

leerDatos[,'Fecha':=lapply(.SD, function(x) as.POSIXct(x, tz=Sys.timezone())), .SDcols = 'Fecha']
leerDatos[,nombres[c(2:3)]:=lapply(.SD, function(x) as.integer(x, tz=Sys.timezone())), .SDcols = nombres[c(2:3)]]
leerDatos[,nombres[-c(1:3)]:=lapply(.SD, function(x) as.numeric(x)), .SDcols = nombres[-c(1:3)]]
datos<-leerDatos[,.SD, .SDcols = c('Fecha',"Temp",  "HR" , "Lluvia" ,"VientoPromEscalar" ,  "DireccionViento" , "SDTemp", "SDHR","SDVviento","VelMaxViento", "SensaTermiMax","SensaTermiMin","RadSol" )]
return(data.frame(datos))
}

#get_weather_data()

