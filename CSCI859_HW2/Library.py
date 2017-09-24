
def DiffH(states):
# This method is to convert H into X and Y (from 3 states into 4 states)
# O -> Y -> I -> X -> O
    newStates = ''
    for i in range(0,len(states)):
        if states[i] == 'O':
            newStates += 'O'
        elif states[i] == 'I':
            newStates += 'I'
        elif states[i] == 'H' :
            if states[i-1] == 'O':
                newStates += 'Y'
            elif states[i-1] == 'H':
                newStates += newStates[len(newStates)-1]
            elif states[i-1] == 'I':
                newStates += 'X' 
    return newStates
def CheckLetter(sequence):
#Find the appearance of the letters in sequence
    List = []
    for each in sequence:
        for letter in each:
            if List.count(letter) == 0:
                List.append(letter)  
    print (List)
def CombineList(listA, listB):
    if len(listA)==len(listB):
        for i in range(0, len(listA)):
            #listA[i] = listA[i] + listB[i]
            listA[i] = listA[i] + listB[i]
    return listA

def CalculProb(sequences, states):
#This class aims to calculate the emission and transition probabilities of a amino acid sequence
# two list will be transmitted into the class as source.
# Emission index: 0=A, 1=C, 2=D, 3=E, 4=F, 5=G, 6=H, 7=I, 8=K, 9=L, 10=N, 11=P, 12=Q, 13=R, 14=S, 15=T, 16=V, 17=W, 18=Y    
    OEmission = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    YEmission = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    IEmission = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    XEmission = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    def checkEmission(countList, emission):
        if emission == 'A': countList[0] += 1
        elif emission == 'C': countList[1] += 1
        elif emission == 'D': countList[2] += 1
        elif emission == 'E': countList[3] += 1
        elif emission == 'F': countList[4] += 1
        elif emission == 'G': countList[5] += 1
        elif emission == 'H': countList[6] += 1
        elif emission == 'I': countList[7] += 1
        elif emission == 'K': countList[8] += 1
        elif emission == 'L': countList[9] += 1
        elif emission == 'N': countList[10] += 1
        elif emission == 'P': countList[11] += 1
        elif emission == 'Q': countList[12] += 1
        elif emission == 'R': countList[13] += 1
        elif emission == 'S': countList[14] += 1
        elif emission == 'T': countList[15] += 1
        elif emission == 'V': countList[16] += 1
        elif emission == 'W': countList[17] += 1
        elif emission == 'Y': countList[18] += 1
    def countEmission(ProteinSeq, ProteinState):
        for i in range(0,len(ProteinSeq)-1):
            if ProteinState[i] == 'O': checkEmission(OEmission,ProteinSeq[i])
            elif ProteinState[i] == 'Y': checkEmission(YEmission,ProteinSeq[i])
            elif ProteinState[i] == 'I': checkEmission(IEmission,ProteinSeq[i])
            elif ProteinState[i] == 'X': checkEmission(XEmission,ProteinSeq[i])
    for i in range(0 , len(sequences)-1):
        countEmission(sequences[i], states[i])
    TotalEmission = []
    TotalEmission.append(OEmission)
    TotalEmission.append(YEmission)
    TotalEmission.append(IEmission)
    TotalEmission.append(XEmission)
    return TotalEmission    

def CalculTran(states):
#pass a list of states
#0=O->O, 1=O->Y, 2=Y->Y, 3=Y->I, 4=I->I, 5=I->X, 6=X->X, 7=X->O 
    Transition = [0,0,0,0,0,0,0,0]
    for eachProtein in states:
        for j in range(1, len(eachProtein)):
            if eachProtein[j-1] == 'O' and eachProtein[j] == 'O': Transition[0] += 1
            elif eachProtein[j-1] == 'O' and eachProtein[j] == 'Y': Transition[1] += 1
            elif eachProtein[j-1] == 'Y' and eachProtein[j] == 'Y': Transition[2] += 1
            elif eachProtein[j-1] == 'Y' and eachProtein[j] == 'I': Transition[3] += 1
            elif eachProtein[j-1] == 'I' and eachProtein[j] == 'I': Transition[4] += 1
            elif eachProtein[j-1] == 'I' and eachProtein[j] == 'X': Transition[5] += 1
            elif eachProtein[j-1] == 'X' and eachProtein[j] == 'X': Transition[6] += 1
            elif eachProtein[j-1] == 'X' and eachProtein[j] == 'O': Transition[7] += 1

    return Transition
def TrainModel(seqeunces1, states1, sequences2, states2):
    EmitProb = CalculProb(seqeunces1,states1)
    EmitProb_0 = CalculProb(sequences2,states2)
    TranState = CombineList(CalculTran(states1), CalculTran(states2))
 
    for i in range(0,4):
        for j in range(0,19):
            EmitProb[i][j] = EmitProb[i][j]+EmitProb_0[i][j]

    temp = 0 
    for element in EmitProb[0]:
        temp += element;
    for i, element in enumerate(EmitProb[0]):
        EmitProb[0][i] = EmitProb[0][i]/temp

    temp = 0 
    for element in EmitProb[1]:
        temp += element;
    for i, element in enumerate(EmitProb[1]):
        EmitProb[1][i] = EmitProb[1][i]/temp

    temp = 0 
    for element in EmitProb[2]:
        temp += element;
    for i, element in enumerate(EmitProb[2]):
        EmitProb[2][i] = EmitProb[2][i]/temp

    temp = 0 
    for element in EmitProb[3]:
        temp += element;
    for i, element in enumerate(EmitProb[3]):
        EmitProb[3][i] = EmitProb[3][i]/temp

    tempO = TranState[0] + TranState[1]
    tempY = TranState[2] + TranState[3]
    tempI = TranState[4] + TranState[5]
    tempX = TranState[6] + TranState[7]
    TranState[0] = TranState[0]/tempO
    TranState[1] = TranState[1]/tempO
    TranState[2] = TranState[2]/tempY
    TranState[3] = TranState[3]/tempY
    TranState[4] = TranState[4]/tempI
    TranState[5] = TranState[5]/tempI
    TranState[6] = TranState[6]/tempX
    TranState[7] = TranState[7]/tempX            
    return EmitProb, TranState
def GetEmissionProb(EmitProb, state, symbol):
    stateNum = 0
    symbolNum = 0
    if state == 'O': stateNum = 0
    elif state == 'Y': stateNum = 1 
    elif state == 'I': stateNum = 2
    elif state == 'X': stateNum = 3
    else: print('Wrong State !!!')

    if symbol == 'A' : symbolNum = 0
    elif symbol == 'C' : symbolNum = 1
    elif symbol == 'D' : symbolNum = 2
    elif symbol == 'E' : symbolNum = 3
    elif symbol == 'F' : symbolNum = 4
    elif symbol == 'G' : symbolNum = 5
    elif symbol == 'H' : symbolNum = 6
    elif symbol == 'I' : symbolNum = 7
    elif symbol == 'K' : symbolNum = 8
    elif symbol == 'L' : symbolNum = 9
    elif symbol == 'N' : symbolNum = 10
    elif symbol == 'P' : symbolNum = 11
    elif symbol == 'Q' : symbolNum = 12
    elif symbol == 'R' : symbolNum = 13
    elif symbol == 'S' : symbolNum = 14
    elif symbol == 'T' : symbolNum = 15
    elif symbol == 'V' : symbolNum = 16
    elif symbol == 'W' : symbolNum = 17
    elif symbol == 'Y' : symbolNum = 18
    else: print('Wrong Symbol !!!' + str(symbol) +'!')

    return EmitProb[stateNum][symbolNum]
def StateGen(sequences, states,states3, seqeunces1, states1, sequences2, states2):
    oProb, yProb, iProb, xProb = [], [], [], []
    oTrace, yTrace, iTrace, xTrace = [], [], [], []
    EmitProb, TranProb = TrainModel(seqeunces1,states1,sequences2,states2)

    oProb.append(20*0.5*GetEmissionProb(EmitProb,'O',sequences[0]))
    yProb.append(20*0*GetEmissionProb(EmitProb,'Y',sequences[0]))
    iProb.append(20*0.5*GetEmissionProb(EmitProb,'I',sequences[0]))
    xProb.append(20*0*GetEmissionProb(EmitProb,'X',sequences[0]))
    for i in range(1, len(sequences)-1):     
        oProb.append(20*GetEmissionProb(EmitProb,'O',sequences[i])*max(oProb[i-1]*TranProb[0], xProb[i-1]*TranProb[7]))
        yProb.append(20*GetEmissionProb(EmitProb,'Y',sequences[i])*max(yProb[i-1]*TranProb[2], oProb[i-1]*TranProb[1]))
        iProb.append(20*GetEmissionProb(EmitProb,'I',sequences[i])*max(iProb[i-1]*TranProb[4], yProb[i-1]*TranProb[3]))
        xProb.append(20*GetEmissionProb(EmitProb,'X',sequences[i])*max(xProb[i-1]*TranProb[6], iProb[i-1]*TranProb[5]))
    for i in range(1, len(sequences)): 
        if oProb[i-1]*TranProb[0] > xProb[i-1]*TranProb[7]: oTrace.append(0)
        else: oTrace.append(3)
        if yProb[i-1]*TranProb[2] > oProb[i-1]*TranProb[1]: yTrace.append(1)
        else:  yTrace.append(0)
        if iProb[i-1]*TranProb[4] > yProb[i-1]*TranProb[3]: iTrace.append(2)
        else: iTrace.append(1)
        if xProb[i-1]*TranProb[6] > iProb[i-1]*TranProb[5]: xTrace.append(3)
        else: xTrace.append(2)
    prob, Trace = [], []
    prob.append(oProb)
    prob.append(yProb)
    prob.append(iProb)
    prob.append(xProb)    
    Trace.append(oTrace)
    Trace.append(yTrace)
    Trace.append(iTrace)
    Trace.append(xTrace)
    
    getFinal = 0
    for i in range(0, 4):
        if oProb[len(oProb)-1] == max(prob[0][len(oProb)-1], prob[1][len(oProb)-1], prob[2][len(oProb)-1], prob[3][len(oProb)-1]): 
            getFinal = 0
        elif yProb[len(oProb)-1] == max(prob[0][len(oProb)-1], prob[1][len(oProb)-1], prob[2][len(oProb)-1], prob[3][len(oProb)-1]):
            getFinal = 1
        elif iProb[len(oProb)-1] == max(prob[0][len(oProb)-1], prob[1][len(oProb)-1], prob[2][len(oProb)-1], prob[3][len(oProb)-1]):
            getFinal = 2
        elif xProb[len(oProb)-1] == max(prob[0][len(oProb)-1], prob[1][len(oProb)-1], prob[2][len(oProb)-1], prob[3][len(oProb)-1]):
            getFinal = 3

    reverseTrace = []
    reverseTrace.append(Trace[getFinal][len(oTrace)-1])
    index = getFinal
    for i in range(1, len(oTrace)):
        reverseTrace.append(Trace[index][len(oTrace)-i-1])
        index = Trace[index][len(oTrace)-i-1]
    forwardTrace = []
    for i in range(0, len(reverseTrace)):
        forwardTrace.append(reverseTrace[len(reverseTrace)-1 - i])

    for i in range(0,len(forwardTrace)):
        if forwardTrace[i] == 0: forwardTrace[i] = 'O'
        elif forwardTrace[i] == 1: forwardTrace[i] = 'Y'
        elif forwardTrace[i] == 2: forwardTrace[i] = 'I'
        elif forwardTrace[i] == 3: forwardTrace[i] = 'X'
        else: print('Wrong')
    count = 0;
    for i in range(1,len(forwardTrace)):
        if forwardTrace[i] == states[i]:
            count += 1

    result4 = count

    for k in range(0, len(forwardTrace)-1):
        if forwardTrace[k] == 'Y': forwardTrace[k] = 'H'
        elif forwardTrace[k] == 'X': forwardTrace[k] = 'H'
    count = 0
    for i in range(0,len(forwardTrace)-1):
            if forwardTrace[i] == states3[i]:
                count += 1
    result3 = count
    number  = len(forwardTrace)
    #print(forwardTrace)
    return result4, result3, forwardTrace, number

