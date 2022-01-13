import sys
if len(sys.argv)<3:
    sys.exit(2)
h=sys.argv[1]
h=int(h)
c=sys.argv[2]
for i in range(h):
    print((h-i)*" "+(2*i+1)*c)
print("the name of the file is:",sys.argv[0])




