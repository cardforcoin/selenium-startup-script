run: server.jar chromedriver
	./run.sh



# server #######################################################################

selenium-server-standalone-2.42.2.jar:
	wget http://selenium-release.storage.googleapis.com/2.42/$@ --no-use-server-timestamps

server.jar: selenium-server-standalone-2.42.2.jar
	if [ -e $@ ]; then unlink $@; fi
	ln -s selenium-server-standalone-2.42.2.jar $@



# chrome driver ################################################################

chromedriver_linux64-2.10.zip:
	wget https://chromedriver.storage.googleapis.com/2.10/chromedriver_linux64.zip -O $@ --no-use-server-timestamps

chromedriver_linux64-2.10/chromedriver: chromedriver_linux64-2.10.zip
	if [ ! -e $@ ]; then unzip -DD chromedriver_linux64-2.10.zip -d chromedriver_linux64-2.10; fi

chromedriver: chromedriver_linux64-2.10/chromedriver
	if [ -e $@ ]; then unlink $@; fi
	ln -s chromedriver_linux64-2.10/chromedriver $@



# phantomjs driver #############################################################

phantomjs-1.9.7-linux-x86_64.tar.bz2:
	wget https://bitbucket.org/ariya/phantomjs/downloads/$@ --no-use-server-timestamps

phantomjs-1.9.7-linux-x86_64/bin/phantomjs: phantomjs-1.9.7-linux-x86_64.tar.bz2
	if [ ! -e $@ ]; then tar -xjf phantomjs-1.9.7-linux-x86_64.tar.bz2; fi

phantomjs: phantomjs-1.9.7-linux-x86_64/bin/phantomjs
	if [ -e $@ ]; then unlink $@; fi
	ln -s phantomjs-1.9.7-linux-x86_64/bin/phantomjs $@

################################################################################



.PHONY: run-chrome chromedriver phantomjs server.jar
