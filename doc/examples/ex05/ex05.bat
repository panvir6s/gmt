REM		GMT EXAMPLE 05
REM
REM Purpose:	Generate grid and show monochrome 3-D perspective
REM GMT modules:	grdmath, grdview, text, makecpt
REM DOS calls:	del
REM
gmt begin ex05
	gmt grdmath -R-15/15/-15/15 -I0.3 X Y HYPOT DUP 2 MUL PI MUL 8 DIV COS EXCH NEG 10 DIV EXP MUL = sombrero.nc
	gmt makecpt -C128 -T-5,5 -N
	gmt grdview sombrero.nc -JX12c -JZ4c -B -Bz0.5 -BSEwnZ+t"z(r) = cos (2@~p@~r/8) @~\327@~e@+-r/10@+" -N-1+gwhite -Qs -I+a225+nt0.75 -C -R-15/15/-15/15/-1/1 -p120/30 --FONT_TITLE=50p,ZapfChancery-MediumItalic --MAP_TITLE_OFFSET=-1c
	del sombrero.nc
gmt end show
