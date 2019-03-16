import json


def check_json(line):
    try:
        json.loads(line.strip()[:-1])
    except ValueError:
        print('Skipped invalid json object: %s' % line.strip())


in_file = '../data/raw_data/TrainingFinal.txt'

dialogs = []
cnt = 0
with open(in_file) as f:
    buf = []
    for line in f:
        line = line.strip()
        if not ('[' in line or ']' in line):
            check_json(line)

        buf.append(line)
        if ']' in line:
            dlg = ''.join(buf)
            dlg = dlg.strip()
            dlg = dlg[:-2] + dlg[-1]
            dialogs.append(dlg)
            buf = []
            cnt += 1

print('Processed dialogs: %d' % cnt)

# TODO split the data

out_file = '../data/corpora_processed/train_processed_dialogs.txt'
with open(out_file, 'w') as f:
    for item in dialogs:
        f.write(item + '\n')

out_file = '../data/corpora_processed/val_processed_dialogs.txt'
with open(out_file, 'w') as f:
    for item in dialogs:
        f.write(item + '\n')
