*DECK ZABS
      DOUBLE PRECISION FUNCTION ZABS (ZR, ZI)
C***BEGIN PROLOGUE  ZABS
C***SUBSIDIARY
C***PURPOSE  Subsidiary to ZBESH, ZBESI, ZBESJ, ZBESK, ZBESY, ZAIRY and
C            ZBIRY
C***LIBRARY   SLATEC
C***TYPE      ALL (ZABS-A)
C***AUTHOR  Amos, D. E., (SNL)
C***DESCRIPTION
C
C     ZABS COMPUTES THE ABSOLUTE VALUE OR MAGNITUDE OF A DOUBLE
C     PRECISION COMPLEX VARIABLE CMPLX(ZR,ZI)
C
C***SEE ALSO  ZAIRY, ZBESH, ZBESI, ZBESJ, ZBESK, ZBESY, ZBIRY
C***ROUTINES CALLED  (NONE)
C***REVISION HISTORY  (YYMMDD)
C   830501  DATE WRITTEN
C   910415  Prologue converted to Version 4.0 format.  (BAB)
C***END PROLOGUE  ZABS
      DOUBLE PRECISION ZR, ZI, U, V, Q, S
C***FIRST EXECUTABLE STATEMENT  ZABS
      U = ABS(ZR)
      V = ABS(ZI)
      S = U + V
C-----------------------------------------------------------------------
C     S*1.0D0 MAKES AN UNNORMALIZED UNDERFLOW ON CDC MACHINES INTO A
C     TRUE FLOATING ZERO
C-----------------------------------------------------------------------
      S = S*1.0D+0
      IF (S.EQ.0.0D+0) GO TO 20
      IF (U.GT.V) GO TO 10
      Q = U/V
      ZABS = V*SQRT(1.D+0+Q*Q)
      RETURN
   10 Q = V/U
      ZABS = U*SQRT(1.D+0+Q*Q)
      RETURN
   20 ZABS = 0.0D+0
      RETURN
      END
