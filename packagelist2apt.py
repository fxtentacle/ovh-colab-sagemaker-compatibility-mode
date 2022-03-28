with open("package-list.txt", "rt") as f:
    lines = f.readlines()

lines = [l for l in lines if 'automatic]' not in l]
lines = [l for l in lines if '[installed' in l]
lines = [l.split(',',2)[0] for l in lines]
lines = [l.split(' ',2)[0] for l in lines]
lines = [l.split('/',2)[0] for l in lines]
lines = list(set(lines)-{'libcudnn8','libcudnn8-dev','libnccl-dev','libnccl2'})

print(lines)

with open("apt-install.sh", "wt") as f:
    f.write('#!/usr/bin/env bash\nset -eu\n\n')
    f.write('apt-get install -qy --no-install-recommends ' + " ".join(lines) + '\n')

