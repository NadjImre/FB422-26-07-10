//M(servis)
;FB290

def VremeRada = (I///,$89623 ,"Tc","min"///"$AN_PoWERON_TIME"/25,10,340/375,10,140)


def Vreme10 = (I///,$89624 ,"Tg","sec"///"$AC_ACT_PROG_NET_TIME"/25,,340/375,,140)

def VremeZadnjegPrograma = (I///,$89625 ,"Tg","sec"///"$AC_OLD_PROG_NET_TIME"/25,,340/375,,140)

;def UkupoGlavnoVreme = (R1///,$89626 ,"Tg","min"///"vreme[0]"/25,,340/375,,140)


def Brojac2 = (I///,$89627 ,"","kom"///"$AC_TOTAL_PARTS"/25,200,340/375,200,140)

def Brojac3 = (I///,$89628,"","kom"///"$AC_ACTUAL_PARTS"/25,,340/375,,140)

def Brojac4 = (I///,$89629 ,"","kom"///"$AC_SPECIAL_PARTS"/25,,340/375,,140)

;def BROJAC = (I///,$89630,"N",$89073///"SCHETCHIK[0]"/25,,340/375,,140)

LOAD
  LS("MENU","CMENI.COM",1)
END_LOAD

//END



