from gpiozero import LED,Button
from time import time,sleep
from random import randint

led = LED(17)
btn = Button(4)

while True:
        sleep(randint(1,3))
        led.on()
        start=time()
        btn.wait_for_press()
        led.off()
        end=time()
        print(end-start,"seconds")
