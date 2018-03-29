#! /usr/bin/python
# -*- coding: UTF-8 -*-

__author__ = 'Caibiy'

import Adafruit_DHT,os,time
#家庭测试小demo
class smartHome(object):
	sensor = Adafruit_DHT.DHT11
	def __init__(self,pdht11,pmq2,pbuzzer):
		self.__pdht11 = pdht11
		self.__pmq2 = pmq2
		self.__pbuzzer = pbuzzer
		#初始化mode
		os.system('gpio -g mode %s out' % pdht11)
		os.system('gpio -g mode %s out' % pmq2)
		os.system('gpio -g mode %s out' % pbuzzer)
	def buzzer(self):
		os.system('gpio -g write %s 1' % self.__pbuzzer)
		time.sleep(0.5)
		os.system('gpio -g write %s 0' % self.__pbuzzer)
	def readDth(self):
		humidity,temperature = Adafruit_DHT.read_retry(self.sensor,self.__pdht11)
		if humidity is not None and temperature is not None:
			print('temp:%s,humidity%d' % (humidity,temperature))
		
def init():
	s = smartHome(23,11,21)
	s.buzzer()
	s.readDth()

if __name__ =='__main__':
	init()
