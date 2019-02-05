
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>
#include <pthread.h>
#include "structs.h"

void error(const char *msg)
{
    perror(msg);
    exit(1);
}

/*Global variables that will be accessed in the thread function  */
int clientlist[2]; /*the socket numbers through with the 2 clients (e.g. data link layer) are connected to this wire*/
int client_num = 0;
pthread_t thread_list[2];

/*the thread function that will receive frames from socket (i.e. data_link layer) and send the received frames to another socket*/  
void * onesocket ( int threadsockfd)
{
	/*add codes to declear local variables*/
	int threadNum;
	frame incomingFrame;
	 while (1)
	 {
		/*add codes to receive a frame from threadsocketfd*/
		threadNum = read(threadsockfd, &incomingFrame, sizeof(frame));
		if(threadNum < 0) error("ERROR in receiving frame");
		printf("Physical layer received a frame from: %s\n", incomingFrame.my_packet.nickname);
		/*if the message in the frame in EXIT close the socket and terminate this thread using
				close(threadsockfd);
				return NULL;
		 other wise send the frame to the other socket (which is stored in clientlist) 
		*/
		if(strcmp (incomingFrame.my_packet.message, "EXIT\n" ) == 0){
			close(threadsockfd);
			return;
		}
		threadNum = write((clientlist[(threadsockfd+1)%2]), &incomingFrame, sizeof(frame));
		if(threadsockfd < 0) error("ERROR in writing to socket");
		else printf("Frame has been sent to the other Datalink Layer\n");
	 }
}

int main(int argc, char *argv[])
{
	/*add codes to declear local variables*/
	int sockfd, newsockfd, portno;
	socklen_t clilen;
	char buffer[256];
	struct sockaddr_in serv_addr;
	struct sockaddr_in cli_addr;
	int n;

	/*check the number of arguments*/
     if (argc < 2) {
         fprintf(stderr,"ERROR, no port provided\n");
         exit(1);
     }

	/*add codes to create a socket (sockfd), bind its address to it and listen to it*/
     sockfd = socket(AF_INET, SOCK_STREAM,0);
     if(sockfd < 0) error("ERROR in opening socket");
     bzero((char *) &serv_addr, sizeof(serv_addr));
     portno = atoi(argv[1]);
     serv_addr.sin_family = AF_INET;
     serv_addr.sin_addr.s_addr = INADDR_ANY;
     serv_addr.sin_port = htons(portno);
     if(bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0) error("ERROR in binding"); 
     int i;
	for (i=0;i<2;i=i+1) /*only accept two requests*/
	{
		listen(sockfd, 5);
		clilen = sizeof(cli_addr);
		/*accept a request from the data link layer*/
		 newsockfd = accept(sockfd, 
					 (struct sockaddr *) &cli_addr, 
					 &clilen);
		 if(newsockfd < 0) error("ERROR in accepting");
		 
		/* store the new socket into clientlist*/
		 clientlist[i]=newsockfd;

		 /*creat a thread to take care of the new connection*/
		 pthread_t pth;	/* this is the thread identifier*/
		 pthread_create(&pth,NULL,onesocket,clientlist[i]);
		 thread_list[i]=pth; /*save the thread identifier into an array*/ 
	}
	close(sockfd); /*so that wire will not accept further connection request*/
	pthread_join(thread_list[0],NULL);
	pthread_join(thread_list[1],NULL); /* the main function will not terminated untill both threads finished*/
	return 0;

}
