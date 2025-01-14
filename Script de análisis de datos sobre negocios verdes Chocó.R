library(tidytext)
library(wordcloud)
library(wordcloud2)
library(tidyverse)
Negocios_Verdes_20241225 <- read_csv("Negocios_Verdes_20241225.csv")

#Limpieza y organización de datos.

#Preparación de datos para elaborar nube de palabras.
Bien_o_servicio_NegociosVerdes_tokens <- Negocios_Verdes_20241225 %>% unnest_tokens(output = palabras, input = `BIEN O SERVICIO`)
vector_de_tokens <- Bien_o_servicio_NegociosVerdes_tokens[,9]
vector_de_tokens <- vector_de_tokens %>% filter(palabras !="a", palabras !="la", palabras !="de", palabras !="apartir", palabras !="el", palabras !="lo", palabras !="que", palabras !="nos", palabras !="permite", palabras !="rediucir", palabras !="y", palabras !="del", palabras !="para", palabras !="al", palabras !="en", palabras !="como", palabras !="son", palabras !="se", palabras !="los", palabras !="ademas", palabras !="con", palabras !="o", palabras !="las", palabras !="sin", palabras !="ni", palabras !="es", palabras !="una", palabras !="etc", palabras !="tal", palabras !="así", palabras !="entre", palabras !="un", palabras !="tambien", palabras !="peoduccion", palabras !="estas", palabras !="estan", palabras !="algunos")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "acesorias", "asesorías")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "achin", "achín")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "^achiot$", "achiote")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "achote", "achiote")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "acuatico", "acuático")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "asesorios", "accesorios")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "asociaciòn", "asociación")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "ahumada", "ahumado")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "ahumadoy", "ahumado")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "alimentacion", "alimentación")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "artesanias", "artesanías")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "atum", "atún")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "atun", "atún")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "atùn", "atún")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "bases", "base")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "biocosmetico", "biocosmético")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "bisuteria", "bisutería")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "borojo", "borojó")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "chaquirasy", "chaquira")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "coacinas", "cocina")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "chocò", "chocó")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "comercializacion", "comercialización")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "conservacion", "conservación")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "elaboracion", "elaboración")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "elaboraciòn", "elaboración")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "elaboracción", "elaboración")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "dedicda", "dedicada")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "deshidratatas", "deshidratadas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "duces", "dulces")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "ecologicas", "ecológicas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "ecologico", "ecológico")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "economicos", "económicos")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "elabotados", "elaborados")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "eldepartamento", "departamento")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "elevoracion", "elaboración")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "endemicas", "endémicas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "files", "filetes")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "filites", "filetes")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "frio", "frío")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "gayaba", "guayaba")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "grutas", "frutas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "guanabana", "guanábana")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "harian", "harina")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "harinas", "harina")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "hamburquesas", "hamburguesas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "hidrograficas", "hidrográficas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "jenjibre", "jengibre")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "jose", "josé")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "limon", "limón")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "liquidos", "líquidos")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "manteniemiento", "mantenimiento")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "^mil$", "milpesos")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "multiproposito", "multipropósito")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "name", "ñame")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "^nativa$", "nativas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "nunggues", "nuggets")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "organicas", "orgánicas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "organico", "orgánico")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "paon", "pan")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "peoducción", "producción")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "produccion", "producción")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "produciòn", "producción")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "produción", "producción")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "platano", "plátano")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "politicos", "políticos")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "^pulpa$", "pulpas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "rapidas", "rápidas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "recpetivo", "receptivo")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "region", "región")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "regiòn", "región")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "^shampo$", "shampoo")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "^snack$", "snacks")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "tipicas", "típicas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "tipicos", "típicos")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "tranaformacion", "transformación")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "transformaciónes", "transformaciones")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "^transformacion$", "transformación")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "tuallitas", "toallitas")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "tuberculos", "tubérculos")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "ventas", "venta")
vector_de_tokens$palabras <- str_replace(vector_de_tokens$palabras, "zapayo", "zapallo")

#Modificamos el vector de tokens para que también incluya la frecuencia de cada token (palabra).
vector_de_tokens <- vector_de_tokens %>% count(palabras, name = "Número de palabras")

Negocios_Verdes_20241225$MUNICIPIO <- str_replace(Negocios_Verdes_20241225$MUNICIPIO, "BOJAYA", "BOJAYÁ")
Negocios_Verdes_20241225$MUNICIPIO <- str_replace(Negocios_Verdes_20241225$MUNICIPIO, "ALTO BAUDO", "ALTO BAUDÓ")

#Transformación de datos: preparación de insumos para análisis visual de hallazgos.
Empresas_por_municipio <- Negocios_Verdes_20241225 %>% count(MUNICIPIO, name = "Número de empresas", sort = TRUE) %>% mutate("Porcentaje de empresas por municipio" = (`Número de empresas`/sum(`Número de empresas`))*100)
Distribución_por_sectores <- Negocios_Verdes_20241225 %>% count(SECTOR, name = "Número de empresas por sector económico", sort = T) %>% mutate("Porcentaje de empresas" = (`Número de empresas por sector económico`/sum(`Número de empresas por sector económico`))*100)
Data_cod_mcpio <- Negocios_Verdes_20241225
Data_cod_mcpio$SECTOR <- factor(Negocios_Verdes_20241225$SECTOR, levels = c("OTROS BIENES Y SERVICIOS VERDES SOSTENIBLES", "NO MADERABLES", "ECOTURISMO/TURISMO DE NATURALEZA", "SISTEMAS DE PRODUCCIÓN ECOLÓGICO, ORGÁNICO Y BIOLÓGICO", "AGROINDUSTRIA SOSENIBLE", "INORGÁNICO", "PRODUCTOS DERIVADOS DE LA FAUNA SILVESTRE", "ALIMENTARIO", "AGROINDUSTRIA SOSENIBLE -ALIMENTOS", "MADERABLES", "ORGÁNICO", "CONSTRUCCIÓN SOSTENIBLE", "AGROSISTEMAS SOSTENIBLES"), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))
Relación_Sector_Municipio <- Data_cod_mcpio %>% count(SECTOR, MUNICIPIO)

#Presentación visual de hallazgos.
ggplot(Empresas_por_municipio) + geom_col(aes(`Porcentaje de empresas por municipio`, MUNICIPIO)) + theme(panel.background = element_rect(fill = "green")) + labs(title = "El Carmen de Atrato, Bahía Solano y Quibdó son los municipios\ncon mayor proporción de empresas verdes al interior\ndel departamento del Chocó",  x = "Porcentaje de empresas en el respectivo municipio", y = "Municipio donde se ubica la empresa")
ggplot(Distribución_por_sectores) + geom_col(aes("", `Porcentaje de empresas`, fill = SECTOR)) + coord_polar(theta = "y") + labs(title = "No maderables; sistemas de producción ecológico, orgánico y\nbiológico; otros bienes y servicios verdes sostenibles;\ny ecoturismo/turismo de naturaleza; corresponden\na la categorización de sectores en los cuales\nhay mayor proporción de empresas", x = "Proporción de empresas por sector económico", y = "", fill = "Sector económico en mención") + theme_dark()
ggplot(Relación_Sector_Municipio) + geom_tile(aes(SECTOR, MUNICIPIO, fill = n)) + theme(panel.background = element_rect(fill = "white")) + labs(title = "Los sectores económicos (a los que pertenecen las empresas verdes) que abarcan\nmayor número de municipios al interior del departamento del Chocó son los\nsiguientes: Otros bienes y servicios verdes sostenibles; No maderables;\nEcoturismo/turismo de naturaleza; sistemas de producción ecológico,\norgánico y biológico", x = "Sector económico en mención", y = "Municipio en donde se ubica el emprendimiento")

#Realizamos tres nubes de palabras.
wordcloud2(vector_de_tokens, shape = "circle")
wordcloud(vector_de_tokens$palabras, vector_de_tokens$`Número de palabras`, max.words = 333, colors = c("black", "green", "brown", "gray", "yellow", "red"))
wordcloud(vector_de_tokens$palabras, vector_de_tokens$`Número de palabras`, max.words = 17, colors = c("black", "green", "brown", "gray", "yellow", "red"))


