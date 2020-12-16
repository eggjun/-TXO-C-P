import time
import random

def timeSleep1To5Random():
    time.sleep(random.uniform(1,5))

def timeSleepToMinRandom(x, y):
    randomTime = random.uniform(x*60, y*60)
    print(randomTime/60)
    time.sleep(randomTime)


