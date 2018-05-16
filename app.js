const express = require('express')
const app = express()
const path = require('path')
const bodyParser = require('body-parser')
const { exec } = require('child_process')
const pug = require('pug')
const port = 8001
const ports = require('./model/port')
const system = require('./model/system')
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json())
app.use(express.static(path.join(__dirname,'')))
//信息相关接口
app.post('/api/info',(req,res)=>{
var flag=req.body.flag;
if("psinfo"==flag){
  exec("top -b -n 1 | head -n 30  | tail -n 30",(err,stdout,stderr)=>{
  res.json({"data":stdout});}
)}else if ("sysinfo"==flag){
  res.json(ports.getPort())
}
})
//配置相关接口
app.post('/api/config',(req,res)=>{
var flag=req.body.flag;
if(flag=='magic')
{
//得到当前魔镜的状态     
exec('sh ./raspi/magic_status.sh',(err,stdout,stderr)=>{
   if(err){
    res.json({"err":err})
   }
   if(stdout.indexOf("正在运行")==0){
      res.json({"flag":"magic","data":{"type":1,"status":stdout}});
   }else{
      res.json({"flag":"magic","data":{"type":0,"status":stdout}});
    }
})
}else if(flag=='wifi'){
  //查询wifi状态可当前可用wifi
  var wifiresu = system.wifi();
  if(wifiresu['success']==true){
  res.json(system.wifi())
  }else{
  res.json(null)
  } 
}
else{
 res.json({"flag":flag});
}
})

app.get('/',(req,res)=>{

console.log("Server is running on port:"+port)
	console.log("/");
   res.sendfile(path.join(__dirname,'./view/index.html'))

})
//查询当前wifi是否已经配置
app.get('/api/wifi',(req,res)=>{
  exec("sh ./bin/wifista.sh",(error,stdout,stderr)=>{
    res.json(callback(err,stdout,stderr));
})
})
app.listen(port,()=>{
console.log("Server is running on port:"+port)
})

function callback(err,stdout,stderr,spar="\n"){
if(err){
return {"exec error":err}
}
if(stdout){
return {"flag":"success","data":(stdout.trim()).split(spar)};
}
if(stderr){
return {"flag":"error"}
}
}
