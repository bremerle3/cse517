stoplist = []
buff = []

with open('test.txt', 'r') as stopfile:
    data=stopfile.read()
    for c in data:
        if c == '\n':
            stoplist.append(''.join(buff))
            buff = []
        else:
            buff.append(c)
    else:
        if buff:
            stoplist.append(''.join(buff))
print stoplist
