from time import sleep

i=0
while True:
    with open("example.txt",'a') as file:
        file.write(f"{i}\n")
        i=i+1
        sleep(2)