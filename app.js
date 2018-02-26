const express = require('express')
const app = express()
const path = require('path')
const bodyParser = require('body-parser')
const { exec } = require('child_process')
const pug = require('pug')
const port = 8001
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json())
app.use(express.static(path.join(__dirname,'')))
//api design
app.post('/api/user',(req,res)=>{
 res.json({user:"root"});
})
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
  exec('sh ./raspi/wifi_scan.sh',(err,stdout,stderr)=>{
    if(err){
      res.json({"err":err})
     }
     var res2Json=eval('('+stdout+')'); 
    res.json({"flag":"wifi","data":{"wifis":res2Json["wifis"].split(","),"info":res2Json["info"]}})
  })
}
else{
 res.json({"flag":flag});
}
})

app.get('/',(req,res)=>{
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
