# -*- coding: utf-8-*-                                                                                                                                                        
# 小车插件
import sys
reload(sys)
sys.setdefaultencoding('utf8')
# Standard module stuff                                                                                                                                                     
WORDS = ["小车","小车向前","小车向左","小车向右","小车向后"]
SLUG = "SMARTCAR"
#检查依赖
def check():
	pass
#向前
def front():
	pass
#向后
def after():
	pass
#向左
def left():
	pass
#向右
def right():
	pass

def handle(text, mic, profile, wxbot=None):
	logger = logging.getLogger(__name__)
	
	text = text.split("，")[0]#去除百度识别的中文逗号 
	if text in "小车向前":
		front()
	elif text in "小车向后":
		after()
	elif text in "小车向左":
		left()
	elif text in "小车向右":
		right()
	
#识别指令
def isValid(text):
    return u"小车" in text
