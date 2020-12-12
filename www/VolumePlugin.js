var VolumePlugin = {
    getVolume: function(successCB,errorCB){
        if(navigator.simulator){
            successCB ? successCB() : false;
            return;
        }
        cordova.exec(successCB,errorCB,"VolumePlugin","getVolume",[]);
    },
    setVolume: function(successCB,errorCB,volume){
        if(navigator.simulator){
            successCB ? successCB() : false;
            return;
        }
        cordova.exec(successCB,errorCB,"VolumePlugin","setVolume",[volume]);
    }
};

module.exports = VolumePlugin;