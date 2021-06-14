#!/usr/bin/python3

import sys
import os
import subprocess
import requests
import time
from bs4 import BeautifulSoup
update_script = "./update.sh"
eula = "../Server_Files/eula.txt"
tries = 10

source = requests.get("https://getbukkit.org/").text

soup = BeautifulSoup(source, "html.parser")

body = soup.body

buttons = body.find('div', class_="download-buttons")

download_link = ""
for div in buttons.find_all('div', class_='text'):
    if "SPIGOT" in div.b.text:
        download_link = div.parent['href']

source = requests.get(download_link).text

soup = BeautifulSoup(source, "html.parser")

body = soup.body

download_div = body.find('div', class_=("well"))

download_link = download_div.a['href']

if download_link[:8] == "https://" and download_link[-4:] == ".jar":
    print(download_link)
else:
    print("There was an error fetching the jar file")
    exit()

filename = download_link.split('/')
filename = filename[-1]
version = filename.split('-')[1]

with open("../version.txt", 'w') as f:
    f.write(version)

subprocess.call([update_script, download_link, filename])
