with open("package-list.txt", "rt") as f:
    lines = f.readlines()

lines = [l for l in lines if 'automatic]' not in l]
lines = [l for l in lines if '[installed' in l]
lines = [l.split(',',2)[0] for l in lines]
lines = [l.split(' ',2)[0] for l in lines]
lines = [l.split('/',2)[0] for l in lines]
lines = list(set(lines)-{'libcudnn8','libcudnn8-dev','libnccl-dev','libnccl2'})

print(lines)

splits = [['cuda','libcu'],['opencv','boost','ffmpeg'],['r-cran','r-base'],['misc','']]
for split in splits:
    with open(f"apt-install-{split[0]}.sh", "wt") as f:
        f.write('#!/usr/bin/env bash\nset -eu\n\n')
        subset = [l for l in lines if any(s in l for s in split)]
        f.write('DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends ' + " ".join(subset) + '\n')
        lines = list(set(lines) - set(subset))

