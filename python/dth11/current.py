#! /usr/bin/python
# -*- coding: UTF-8 -*-

import  Adafruit_DHT

sensor =  Adafruit_DHT.DHT11

pin=23

humidity, temperature = Adafruit_DHT.read_retry(sensor, pin)
if humidity is not None and temperature is not None:
    print({'success':True,'data':{'temp':'%.1f'%temperature,'humidity':'%d'%humidity}})
else:
    print({'success':False,'data':'读取失败,请尝试重试'})
