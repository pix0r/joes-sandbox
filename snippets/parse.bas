5 DIM CURSTACK(32), PRECSTACK(32)
10 INPUT "=",IN$
20 X=1:SP=1:PREC=0
25 GOSUB 30
26 PRINT CUR
27 GOTO 10
30 CUR=0
40 GOSUB 500
50 IF MID$(IN$,X,1)<"0" OR MID$(IN$,X,1)>"9" THEN GOTO 90
60 CUR=VAL(RIGHT$(IN$,LEN(IN$)-X+1))
70 IF MID$(IN$,X,1)>="0" AND MID$(IN$,X,1)<="9" THEN X=X+1:GOTO 70
80 GOTO 200
90 IF MID$(IN$,X,1)<>"(" THEN GOTO 140
95 X=X+1
100 GOSUB 520:PREC=1:GOSUB 30:TMP=CUR:GOSUB 530:CUR=TMP
110 GOSUB 500
120 IF MID$(IN$,X,1)<>")" THEN PRINT "Missing )":GOTO 200
130 X=X+1: GOTO 200
140 IF MID$(IN$,X,1)<>"-" THEN GOTO 190
145 X=X+1
150 GOSUB 520:PREC=4:GOSUB 30:TMP=CUR:GOSUB 530:CUR= -TMP
160 GOTO 200
190 PRINT "Unknown input":RETURN
200 GOSUB 500
210 IF MID$(IN$,X,1)<>"*" OR PREC>3 GOTO 250
220 X=X+1
230 GOSUB 520:PREC=3:GOSUB 30:TMP=CUR:GOSUB 530:CUR=CUR*TMP
240 GOTO 200
250 IF MID$(IN$,X,1)<>"+" OR PREC>2 THEN GOTO 290
260 X=X+1
270 GOSUB 520:PREC=2:GOSUB 30:TMP=CUR:GOSUB 530:CUR=CUR+TMP
280 GOTO 200
290 IF MID$(IN$,X,1)<>"-" OR PREC>2 THEN GOTO 330
300 X=X+1
310 GOSUB 520:PREC=2:GOSUB 30:TMP=CUR:GOSUB 530:CUR=CUR-TMP
320 GOTO 200
330 IF MID$(IN$,X,1)<>"/" OR PREC>3 THEN GOTO 370
340 X=X+1
350 GOSUB 520:PREC=3:GOSUB 30:TMP=CUR:GOSUB 530:CUR=CUR/TMP
360 GOTO 200
370 IF MID$(IN$,X,1)<>"^" OR PREC>=5 THEN GOTO 410
380 X=X+1
390 GOSUB 520:PREC=5:GOSUB 30:TMP=CUR:GOSUB 530:CUR=CUR^TMP
400 GOTO 200
410 RETURN
500 IF MID$(IN$,X,1)=" " THEN X=X+1:GOTO 500
510 RETURN
520 CURSTACK(SP)=CUR:PRECSTACK(SP)=PREC:SP=SP+1:RETURN
530 SP=SP-1:CUR=CURSTACK(SP):PREC=PRECSTACK(SP):RETURN
