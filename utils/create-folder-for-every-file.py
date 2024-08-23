import os

PATH = "."

for file in os.listdir(PATH):
    full_path = os.path.join(PATH, file)
    if os.path.isfile(full_path):
        dir_name = ''.join(file.split('.')[:-1])
        if not os.path.exists(dir_name):
            os.makedirs(dir_name)
        os.rename(full_path, f"{dir_name}/{file}")
