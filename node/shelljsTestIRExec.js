var shell = require('shelljs');
var relativePathOfIRProgram = '../C/binary/';

var child = shell.exec(relativePathOfIRProgram + 'irRemoteExculsive', {silent:true,async:true}, function(code,output) {
	console.log('ir program terminated');
	console.log('Exit code:', code);
  	console.log('Program output:', output);
});

child.stderr.on('data', function(data) {
	data = data.slice(0, data.length - 1); //remove newline char
	console.log('data:' + data);
});
