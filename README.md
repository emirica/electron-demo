# electron-demo
How to create your own Skype Linux client

We use typescript, hence we need tsc to "compile"
Steps:
	1. npm install
	2. install typings:
		node_modules/.bin/typings install dt~electron@1.4.8 --save --global
		node_modules/.bin/typings install dt~node --save --global
	3. "compile"
		node_modules/.bin/tsc
