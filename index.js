const express = require('express')
const app = express()
const path = require('path')
const bodyParser = require('body-parser')
const { exec } = require('child_process');
app.use(bodyParser.json())
app.use(express.static(path.join(__dirname,'')))

app.get('/',(req,res)=>{
res.sendfile(path.join(__dirname,'index.html'))
})
//Show progress status
app.get('/api/ps',(req,res)=>{
  exec('ps -la',(err,stout,sterr)=>{
  if(err){
  console.error("ps err:"+err);
}
if(stout){

res.send(stout);
}else{
res.send(sterr);
}

})
})

app.get('/api/ls',(req,res)=>{
exec('echo "User:${USER}"',(error,stdout,stderr)=>{
if(error){
console.error('exec error:${error}')
return;
}
if(stdout){
res.send('stdout:'+stdout.replace('User','').trim());
}
if(stderr){
res.send('stderr:'+stderr);
}
})
})
app.listen(8080,()=>{
console.log("Server is running on port: 8080")
})
