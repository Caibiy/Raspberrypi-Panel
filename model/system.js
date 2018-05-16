var execSync = require('child_process').execSync;

module.exports ={
        wifi:function(){
                var result = execSync('bash ./raspi/wifi_scan.sh')
                var re2Json = eval('('+result+')')
                if(re2Json){
                    return {
                            success:true,
                            "flag":"wifi",
                            "data":{
                                    "wifis":arraySlice(re2Json["wifis"].split(",")),
                                 "info":re2Json["info"]
                                }
                        }
                }else{
                        return{
                            success:false
                            }
                    }
            },
        wifista:function(){
                var result = execSync('bash ./raspi/wifista.sh')
                if(result){
                        return{
                                success:true,
                                result:result
                            }
                    }else{
                       return {
                                success:false
                           } 
                        }
            }


    }

function arraySlice(arr){
	var new_arr=[];
	for(var i=0;i<arr.length;i++){
		if(new_arr.indexOf(arr[i])==-1){
			new_arr.push(arr[i]);
		}
	}
	return new_arr
}
