from matplotlib import pyplot as plt
import urllib.request
import json
from p_tqdm import p_map
from time import sleep
import random

btc_prices=[]
keys=["key1","key2","key3","key4"]
url="https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC&tsyms=EUR&e=CCCAGG"
for i in range(30):
    key=random.choice(keys)
    with urllib.request.urlopen(url) as response:
        html = response.read()
    data = json.loads(html)
    btc_prices.append(data['BTC']['EUR'])
    sleep(2)

fig = plt.figure(figsize=(10, 7))
plt.bar(list(range(30)),btc_prices)
plt.show()
