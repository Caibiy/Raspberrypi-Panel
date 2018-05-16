var execSync = require('child_process').execSync;

module.exports = {
    getPort:function(){
        var result = execSync('./raspi/port.sh').toString().split(',').join(',')
        return {
            data:result
        }
    }
}
