
import socket
import sys

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the port
server_address = ("localhost", 10000)
print >>sys.stderr, 'starting up on %s port %s' % server_address
sock.bind(server_address)
