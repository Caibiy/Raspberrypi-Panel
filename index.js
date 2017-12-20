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
