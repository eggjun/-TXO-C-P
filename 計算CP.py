import sqlite3
conn = sqlite3.connect('taifex.db')

try:
    cur = conn.cursor()
    cur.execute('select 日期, 合約, 履約價, 結算價call, 結算價put from txo_cp_all where 日期 == "2020/11/04"  ORDER by 日期 DESC') #抓取資料庫內資料並以日期為排序
    # SELECT * FROM txo_cp GROUP by 日期 ORDER by 日期 DESC 以日期做排序範例
    sqlData = cur.fetchall()
    for i in range(len(sqlData)): #len(sqlData)計算抓取幾筆資料
       
        try:
            if isinstance(sqlData[i][3],float) and isinstance(sqlData[i][4],float): #判斷結算價call與結算價put是否為數字
                cPlusp = float(sqlData[i][3]) + float(sqlData[i][4])  #計算C+P
                cMinusp = abs(float(sqlData[i][3]) - float(sqlData[i][4])) #計算C-P取絕對值             
            cur.execute("insert into txo_c加p (日期, 合約, 履約價, 結算價call, 結算價put, C加P, C減P) values (?, ?, ?, ?, ?, ?, ?) ", 
            (sqlData[i][0], sqlData[i][1], sqlData[i][2], sqlData[i][3], sqlData[i][4], cPlusp,  cMinusp ) )
            #新增進資料庫對應欄位

        except: #如果結算價call與結算價put不是數字，做以下處理
            settlementDate = "結算日"                   
            cur.execute("insert into txo_c加p (日期, 合約, 履約價, 結算價call, 結算價put, 結算日) values (?, ?, ?, ?, ?, ?)",
            (sqlData[i][0], sqlData[i][1], sqlData[i][2], sqlData[i][3], sqlData[i][4],settlementDate))  
            #新增進資料庫對應欄位
 
    conn.commit()


finally:
    conn.close()
    print('update finish!')