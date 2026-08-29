10 '====================================
20 ' メニュー（Pocket BASIC 電源内蔵型用）
30 '====================================
50 FONT_WIDTH=6:FONT_HIGHT=8:SCREEN_WIDTH=128:SCREEN_HIGHT=64:'フォントの幅と高さ
60 MENU_MAX=SCREEN_HIGHT/FONT_HIGHT
70 dim MENU[MENU_MAX],FILE[MENU_MAX]
100 '---------------- メニューの定義 ------------------
110 MENU[0]="PAKMAN":FILE[0]="PAKMAN"
120 MENU[1]="SHOOT":FILE[1]="SHOOT"
130 MENU[2]="INVADER":FILE[2]="INVADER"
190 MENU_NUM=3
1000 '---------------- 画面表示 -----------------------
1100 cls
1110 MARGIN=SCREEN_HIGHT-MENU_NUM*FONT_HIGHT
1120 SPACE=MARGIN/(MENU_NUM+1)
1130 dim ITEM_X[MENU_MAX],ITEM_Y[MENU_MAX],ITEM_WIDTH[MENU_MAX]
1140 for I=0 to MENU_NUM-1
1150    ITEM_X[I]=(SCREEN_WIDTH-strlen(MENU[I])*FONT_WIDTH)/2
1160    ITEM_Y[I]=(I+1)*SPACE+I*FONT_HIGHT
1170    ITEM_WIDTH[I]=strlen(MENU[I])*FONT_WIDTH
1180    putStr ITEM_X[I],ITEM_Y[I],MENU[I],1,set,F
1190 next
1195 update
1200 '----------------　選択 --------------------
1210 SOUND01="T150L64V200C7C6E5G5C7."
1220 SOUND02="T150L64V100C#6V200C#6A5V10A5V200A6A6V10A6."
1230 ITEM=0:gosub 3000:update:'カーソルを表示
1300 while -1
1305    SEL_ITEM=ITEM
1310    if keyU()=1 then SEL_ITEM=SEL_ITEM-1:if SEL_ITEM<0 then SEL_ITEM=MENU_NUM-1
1320    if keyD()=1 then SEL_ITEM=SEL_ITEM+1:if SEL_ITEM=MENU_NUM then SEL_ITEM=0
1330    if SEL_ITEM<>ITEM then
1340        gosub 3000:sound 0,SOUND01:play 0 
1350        ITEM=SEL_ITEM
1360        gosub 3000:update:sleep 200
1370    end if
1380    if keyA()=1 then sound 0,SOUND02:play 0:run FILE[ITEM]:end
1390 end while
1400 end
3000 '-------------- カーソル表示 ---------------
3010 fill ITEM_X[ITEM]-1,ITEM_Y[ITEM]-1,ITEM_X[ITEM]+ITEM_WIDTH[ITEM],ITEM_Y[ITEM]+FONT_HIGHT,1,xor,F
3090 return
