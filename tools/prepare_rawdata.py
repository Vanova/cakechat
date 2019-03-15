in_file = '../data/raw_data/TrainingFinal.txt'

dialogs = []
cnt = 0
with open(in_file) as f:
    buf = []
    for line in f:
        buf.append(line.strip())
        if ']' in line:
            dlg = ''.join(buf)
            dlg = dlg[:-2] + dlg[-1]
            dialogs.append(dlg)
            buf = []
            cnt += 1

print('Processed dialogs: %d' % cnt)

# split data

out_file = '../data/corpora_processed/all_dialogs.txt'
with open(out_file, 'w') as f:
    for item in dialogs:
        f.write(item + '\n')
