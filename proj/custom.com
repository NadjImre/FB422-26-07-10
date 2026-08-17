
//S(Start)
;FB290
;april 2020

VS1=("",,se2)
VS2=("",,se2)
VS3=("",,se2)
VS4=("",,se2)
VS5=("",,se2)
VS6=("",,se2)
VS7=("",,se2)

HS1=($89150,,se1)
HS2=($89136,,se1)
HS3=($89592,,se1)
HS4=("",,se2)
HS5=("",,se2)
HS6=("",,se2)
HS7=("",,se2)
HS8=("",,se2)

PRESS(HS1)
   LM("Opste","copste.com")
END_PRESS

PRESS(HS2)
   LM("Oil","copste.com")
END_PRESS

PRESS(HS3)
   LM("servis","cservis.com")
END_PRESS

//END
