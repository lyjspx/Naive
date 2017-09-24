#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <pthread.h>

void error(const char *msg){
    perror(msg);
    exit(1);
}

void *SocketThread (int threadSockfd){
    char threadBuffer[256]; // 255 letters could be sent in one message 
    int threadNum;
    int i = 0;
    while(i < 100){
        bzero(threadBuffer, 256);
        threadNum = read(threadSockfd, threadBuffer, 255);
        if(threadNum < 0) error("ERROR reading from socket");
        printf("Message received from %d th client: %s\n", threadSockfd-3,threadBuffer);
        if(strcmp(threadBuffer, "EXIT\n") == 0) return 0;
        threadNum = write(threadSockfd, "Message received (Want to quit? Enter: EXIT)", 46);
        if(threadNum < 0) error("ERROR writing to socket");
        i++;
    }
    close(threadSockfd);
    return 0;
}

int main(int argc, char *argv[]){
    int sockfd, newSockfd, portno;
    socklen_t clilen;
    char buffer[256];
    struct sockaddr_in serv_addr;
    struct sockaddr_in cli_addr;
    int n;
    if(argc < 2){
        fprintf(stderr,"ERROR, no port provided\n");
        exit(1);
    }
    sockfd = socket(AF_INET, SOCK_STREAM,0);
    if(sockfd < 0) error("ERROR opening socket");
    bzero((char *) &serv_addr, sizeof(serv_addr));
    portno = atoi(argv[1]);
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(portno);
    if(bind(sockfd,(struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0) error("ERROR on binding");
    int i = 0;
    //This program could receive 100 messages at most
    while(i < 100){
        listen(sockfd,5);
        clilen = sizeof(cli_addr);
        newSockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
        if(newSockfd < 0) error("ERROR on accept");
        pthread_t pth;
        pthread_create(&pth, NULL, SocketThread, newSockfd);
        i ++;
    }
   // pthread_join(pth, NULL);
    close(sockfd);
    printf("This program is over");
    printf("Bye!");
    return 0;
}


