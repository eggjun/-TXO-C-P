from bs4 import BeautifulSoup
from selenium import webdriver
import sqlite3
from timeSleepRandom import timeSleep1To5Random
from webdriver_manager.chrome import ChromeDriverManager


conn = sqlite3.connect('taifex.db')
cur = conn.cursor()

try:
    options = webdriver.ChromeOptions() #建立物件chromeoptions
    chrome = webdriver.Chrome(ChromeDriverManager().install()) 
    chrome.set_page_load_timeout(30) #設定等待時間
    chrome.get('https://www.taifex.com.tw/cht/3/optDailyMarketSummary') #連結測試網址
   
    
    for j in range(0,5250): #250個交易日 * 21年
        
        timeSleep1To5Random() #等待數秒後繼續執行
        soup = BeautifulSoup(chrome.page_source , 'html5lib') #解析網頁資訊
        
        htmlTable = soup.find_all('table','table_a' ) #找網頁原始碼裡 table中所有的 table_a(分買權、賣權)
        trsCall = htmlTable[0].find_all('tr') #找到買權裡所有 tr
        trsPut = htmlTable[1].find_all('tr') #找到賣權裡所有 tr
        
        for i in range(1,len(trsCall)): #range裡的 1 是排除表格第一行標題所以不從 0 開始，len(trsCall)計算買權有幾筆資料   
            
            date = soup.find('h3','clearfix').find('span','right').text #抓網頁中裡的 '日期：2020/11/09' 這個資料            
            dateSplit = date.split(':',1) #將上面的 '日期：2020/11/09' 以 '：' 分割  
            
            tdsCall = [td for td in trsCall[i].children]  #取得買權裡 tr中所有 td轉為list
            tdsPut = [td for td in trsPut[i].children]  #取得賣權裡 tr中所有 td轉為list

            if len(tdsCall) <10: #判斷表格內長度是否小於十，要排除掉最後一行的文字
                break               


            cur.execute('insert into txo_cp_all(日期, 合約, 履約價, 結算價call, 結算價put) values(?, ?, ?, ?, ?)', #新增資料到資料庫
                        (dateSplit[1],tdsCall[1].text, tdsCall[3].text,tdsCall[11].text, tdsPut[11].text)) 
            
        conn.commit() #執行這行才會真的寫入資料表
        
        chrome.find_element_by_xpath('/html/body/div[2]/div[4]/div[2]/div/div[2]/table/tbody/tr[4]/td/input[1]').click() #抓取網頁中的 '前一日'並點擊
    timeSleep1To5Random() #等待數秒後繼續執行
    
    
        
finally:
    conn.close()
    print('finish')

