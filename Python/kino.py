from matplotlib import pyplot as plt
import urllib.request
import json
from p_tqdm import p_map

with urllib.request.urlopen('https://api.opap.gr/draws/v3.0/1100/last-result-and-active') as response:
    html = response.read()
data = json.loads(html)
nums = data['last']['winningNumbers']['list']
last_draw = data['last']["drawId"]


def get_draw(id):
    with urllib.request.urlopen('https://api.opap.gr/draws/v3.0/1100/%s' % id) as response:
        html = response.read()
    data = json.loads(html)
    return data['winningNumbers']['list']


mydraws=list(range(last_draw-100,last_draw))
draws = p_map(get_draw, [i for i in mydraws])
for d in draws:
    nums += d

fig = plt.figure(figsize=(10, 7))
plt.bar(list(range(1, 81)), [nums.count(i) for i in range(1, 81)])
plt.show()
