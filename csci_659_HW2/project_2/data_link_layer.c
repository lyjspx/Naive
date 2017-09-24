
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h> 
#include <pthread.h>
#include "structs.h"

void error(const char *msg)
{
    perror(msg);
    exit(1);
}

/*global variables to be used in the threads*/
int network_layersockfd;//the socket through which the network layer is connected.
int wiresockfd; //the socket through which the wire is connected.


/*the thread function that receives frames from the wiresocket and sends packets to the network_layer */
void * rcvfromwiresend2network_layer ( char *argv[] )
{
	/*add codes to declare locals*/
	char threadBuffer[256];
	int threadNum;
	frame incomingFrame;

	 while (1)
	 {
		 /*add codes receive a frame from wire*/
		 threadNum = read(wiresockfd, &incomingFrame, sizeof(frame));
		 if(threadNum < 0) error("ERROR in reading from Physical Layer");
		 printf("Receiving a frame from Physical Layer");
		 printf("Frame's sequence number: %d\n", incomingFrame.seq_num);
		 printf("Frame's type: %d\n", incomingFrame.type);

			 
		/*add codes to send the included packet to the network layer*/	
		printf("Sending the packet inside to Network Layer\n");
		threadNum = write(network_layersockfd, &incomingFrame.my_packet, sizeof(packet));
		if(threadNum < 0) error("ERROR in sending packet to Network Layer");
	 }
}


int main(int argc, char *argv[])
{
	/*add codes to declear local variables*/
	int sockfd, newsockfd, portno;
	socklen_t clien;
	char buffer[256];
	socklen_t clilen;
	struct sockaddr_in serv_addr;
	struct sockaddr_in cli_addr;
	struct hostent *server;
	int n;
	int wirePortNum;

	int framenumber;
	packet incoming_packet;
	frame outgoing_frame;

	/*check numeber of arguments*/
     if (argc < 4) {
		 fprintf(stderr,"Usage: %s  wire__IP  wire_port data_port\n",argv[0] );
         exit(1);
     }

	/* add codes to connect to the wire. Assign value to gobal varialbe wiresockfd */
	wirePortNum = atoi(argv[2]);
	wiresockfd = socket(AF_INET, SOCK_STREAM, 0);
	if(wiresockfd < 0) error("ERROR in opening socket");
	server = gethostbyname(argv[1]);
    if (server == NULL) {
        fprintf(stderr,"ERROR, no such host\n");
        exit(0);
    }
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr,(char *)&serv_addr.sin_addr.s_addr, server->h_length);
    serv_addr.sin_port = htons(wirePortNum);
    if (connect(wiresockfd,(struct sockaddr *) &serv_addr,sizeof(serv_addr)) < 0) 
        error("ERROR connecting");

	/*generate a new thread to receive frames from the wire and pass packets to the network layer */
	pthread_t wirepth;	// this is our thread identifier
	pthread_create(&wirepth,NULL,rcvfromwiresend2network_layer, NULL);

	/*add codes to create and listen to a socket that the network_layer will connect to. Assign value to global variable network_layersockfd*/
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if(sockfd < 0) error("ERROR in opening socket");
    bzero((char *) &serv_addr, sizeof(serv_addr));
     portno = atoi(argv[3]);
     serv_addr.sin_family = AF_INET;
     serv_addr.sin_addr.s_addr = INADDR_ANY;
     serv_addr.sin_port = htons(portno);
     if(bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0) error("ERROR in binding"); 

     listen(sockfd,5);
	 clilen = sizeof(cli_addr);
	 network_layersockfd = accept(sockfd, 
				 (struct sockaddr *) &cli_addr, 
				 &clilen);
	 if (network_layersockfd < 0) 
		  error("ERROR on accept");
	 printf("create new socket: %d\n", network_layersockfd);
	 close(sockfd);
	/*the main function will receive packets from the network layer and pass frames to wire*/
	 
	 while (1)
	 {
		/*add codes to receive a packet from the network layer*/
		n = read(network_layersockfd, &incoming_packet, sizeof(packet));
		if(n < 0) error("ERROR in receiving packet from Network Layer");
		else printf("A packet received from Network Layer\n");

		/* add codes to wrap the packet into a frame*/	
		bzero((char *) &outgoing_frame, sizeof(frame));
		//leaving the sequence number blank
		outgoing_frame.type = 0;
		outgoing_frame.type=0;
		strcpy (outgoing_frame.my_packet.nickname, incoming_packet.nickname);
		strcpy (outgoing_frame.my_packet.message, incoming_packet.message);
		/*add codes to send the frame to the wire*/
		n = write(wiresockfd,&outgoing_frame,sizeof(frame));
		if (n < 0) error("ERROR sending a frame to wire");
		else printf("A frame has been sent to Physical Layer\n");
		

		/*if the message is "EXIT" */
		 if (strcmp (incoming_packet.message, "EXIT\n")==0) 
		 {
			 pthread_cancel(wirepth); //kill the child thread
			 close(wiresockfd);
			 close (network_layersockfd); //close sockets
			 return 0; //terminate the main function
		 }

	 }

}
