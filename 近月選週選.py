import sqlite3
conn = sqlite3.connect('taifex.db')

try:
    cur = conn.cursor()
    cur.execute('select 日期, 合約, 履約價, 結算價call, 結算價put, 結算日 from txo_c加p where 日期 == "2020/11/04"  ORDER by 日期 DESC') #抓取資料庫內資料並以日期為排序
    # SELECT * FROM txo_cp GROUP by 日期 ORDER by 日期 DESC 以日期做排序範例
    sqlData = cur.fetchall()
    for i in range(len(sqlData)): #len(sqlData)計算抓取幾筆資料
       
        # try:
        #     if sqlData[i][1].find('w') and sqlData[i][5].find('結算日'):
        #        pass 
           
        # except: 
            # week = '週選'
            # print(week)
            cur.execute("update txo_c加p set  合約代號='週選' where "+str(sqlData[i][1])+" like 'W' ") 


    conn.commit()

finally:
    conn.close()
    print('update finish!')