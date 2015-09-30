import cherrypy
import os
from cherrypy.process.plugins import Daemonizer, PIDFile
Daemonizer(cherrypy.engine).subscribe()

PIDFile(cherrypy.engine, '/var/run/MyTestApp.pid').subscribe()

class HelloWorld(object):
	def index(self):
		return "MyTestApp - Hello World!"
	index.exposed = True

cherrypy.config.update({'server.socket_host': '0.0.0.0',})
cherrypy.config.update({'server.socket_port': int(os.environ.get('PORT', '5001')),})
cherrypy.quickstart(HelloWorld())
