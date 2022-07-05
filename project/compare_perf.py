import pandas as pd
from datetime import datetime
import shutil
import sys
import os
import time

#Load Email File

email_csv = sys.argv[1]
bname = os.path.basename(email_csv)
st_time = time.process_time()
emails_df = pd.read_csv(email_csv, memory_map=True)
end_time =time.process_time()
time_taken = end_time - st_time

print(f"Time to load csv file from {email_csv}: {time_taken:,} ms")


st_time = time.process_time()
emails_df.describe()
emails_df.info()
end_time =time.process_time()
time_taken = end_time - st_time

print(f"Access to {email_csv}: {time_taken:,} ms")

#Copy file to /dev/shm
st_time = time.process_time()
memfile = f"/dev/shm/{bname}"
shutil.copy(email_csv, memfile)
end_time =time.process_time()
time_taken = end_time - st_time

print(f"Time to copy file to {memfile}: {time_taken:,} ms")



st_time = time.process_time()
email_2df = pd.read_csv(memfile, memory_map=True )
end_time =time.process_time()
time_taken = end_time - st_time

print(f"Time to load csv file from {memfile}: {time_taken:,} ms")

st_time = time.process_time()
email_2df.describe()
email_2df.info()
end_time =time.process_time()
time_taken = end_time - st_time

print(f"Access to {memfile}: {time_taken:,} ms")
