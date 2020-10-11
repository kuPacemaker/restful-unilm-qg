import socket
import time
HOST = '127.0.0.1'  
PORT = 2593       

msg = "Since mid-May, Uber has required drivers to take selfies to verify they are wearing a mask or face covering before they are able to pick up riders. [SEP] drivers\n"

msg2 = "Since mid-May, Uber has required drivers to take selfies to verify they are wearing a mask or face covering before they are able to pick up riders. [SEP] a mask\n"

msg3 = "Since mid-May, Uber has required drivers to take selfies to verify they are wearing a mask or face covering before they are able to pick up riders. [SEP] riders\n"

msg4 = "Soon, certain riders will also be required to take a selfie prior to ordering a ride. [SEP] certain riders [SEP] cerntain riders\n"

msg5 = "Soon, certain riders will also be required to take a selfie prior to ordering a ride. [SEP] certain riders [SEP] a ride\n"

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((HOST, PORT))
client_socket.sendall(msg.encode())
print(client_socket.recv(1024).decode())
client_socket.close()

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((HOST, PORT))
client_socket.sendall(msg2.encode())
print(client_socket.recv(1024).decode())
client_socket.close()

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((HOST, PORT))
client_socket.sendall(msg3.encode())
print(client_socket.recv(1024).decode())
client_socket.close()

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((HOST, PORT))
client_socket.sendall(msg4.encode())
print(client_socket.recv(1024).decode())
client_socket.close()

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((HOST, PORT))
client_socket.sendall(msg5.encode())
print(client_socket.recv(1024).decode())
client_socket.close()