C      ######################################################################
C      #################      CAE Assistant Company          ################
C      ##############         CAEassistant-com              #############
C      ###########   Copy right by CAE Assistant Company    ###############
C      ######################################################################

C      ######################################################################
C      ######################################################################
C      CAE Assisitant Services: 
C      Toturial Packages,Consultancy,Articles,Q&A,Video Gallery,Online Course
C      ######################################################################
C      Need help with your project? 
C      You can get initial free consultation from (our website caeassistant com)
C      ###################################################################### 	
      SUBROUTINE UMAT(STRESS,STATEV,DDSDDE,SSE,SPD,SCD,
     1 RPL,DDSDDT,DRPLDE,DRPLDT,
     2 STRAN,DSTRAN,TIME,DTIME,TEMP,DTEMP,PREDEF,DPRED,CMNAME,
     3 NDI,NSHR,NTENS,NSTATV,PROPS,NPROPS,COORDS,DROT,PNEWDT,
     4 CELENT,DFGRD0,DFGRD1,NOEL,NPT,LAYER,KSPT,JSTEP,KINC)
C
      INCLUDE 'ABA_PARAM.INC'
C
      CHARACTER*80 CMNAME
      DIMENSION STRESS(NTENS),STATEV(NSTATV),
     1 DDSDDE(NTENS,NTENS),DDSDDT(NTENS),DRPLDE(NTENS),
     2 STRAN(NTENS),DSTRAN(NTENS),TIME(2),PREDEF(1),DPRED(1),
     3 PROPS(NPROPS),COORDS(3),DROT(3,3),DFGRD0(3,3),DFGRD1(3,3),
     4 JSTEP(4)
	
      REAL*8 EMOD,ENU,EBULK3,EG2,EG,EG3,ELAM,ONE,TWO,THREE
	ONE=1.0
	TWO=2.0
	THREE=3.0
C ----------------------------------------------------------------
C UMAT FOR ISOTROPIC ELASTICITY
C CANNOT BE USED FOR PLANE STRESS
C ----------------------------------------------------------------
C PROPS(1) - E
C PROPS(2) - NU
C ----------------------------------------------------------------
C
       IF (NDI.NE.3) THEN
       WRITE (7, *) 'THIS UMAT MAY ONLY BE USED FOR ELEMENTS
     1 WITH THREE DIRECT STRESS COMPONENTS'
       CALL XIT
       ENDIF
C
C ELASTIC PROPERTIES
	 EMOD=PROPS(1)
	 ENU=PROPS(2)
	 EBULK3=EMOD/(ONE-TWO*ENU)
	 EG2=EMOD/(ONE+ENU)
	 EG=EG2/TWO
	 EG3=THREE*EG
	 ELAM=(EBULK3-EG2)/THREE
	 print*,'ELAM',ELAM
C     
C ELASTIC STIFFNESS
C
	 DO K1=1,NDI
	 DO K2=1,NDI
	 DDSDDE(K2,K1)=ELAM
	 END DO
	 DDSDDE(K1,K1)=EG2+ELAM
	 END DO
	 DO K1=NDI+1, NTENS
	 DDSDDE(K1,K1)=EG
	 END DO
C
C CALCULATE STRESS
C
	 DO K1=1, NTENS
	 DO K2=1, NTENS
	 STRESS(K2)=STRESS(K2)+DDSDDE(K2,K1)*DSTRAN(K1)
	 END DO
	 END DO
C
      RETURN
      END
