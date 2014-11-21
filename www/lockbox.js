var exec = require('cordova/exec');

var Lockbox = {
    setString: function(key, value, successCallback, failureCallback) {
        var args = {
            "key": key
        };
        if (value !== null) {
            args.value = value;
        }
        return exec(
            successCallback,
            failureCallback,
            'Lockbox',
            'setString',
            [args]
        );
    },
    getString: function(key, successCallback, failureCallback) {
        var args = {
            "key": key
        };

        var onSuccess = function(result) {
            if (typeof(result.value) == 'undefined') {
                successCallback(null);
            }
            else {
                successCallback(result.value);
            }
        };

        return exec(
            onSuccess,
            failureCallback,
            'Lockbox',
            'getString',
            [args]
        );
    }
};

module.exports = Lockbox;
