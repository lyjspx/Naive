#! /usr/bin/env python3
import collections, math, sys
# Viterbi Fuction
def Viterbi(x, states, e, a, b): # (observations, states, emit_prob, trans_prob, initial_prob)
    v = {k: [math.log(b[k]) + math.log(e.get(k+x[0], sys.float_info.min))] + [float('-inf')]*(len(x)-1) for k in states} # Viterbi Table
    t = {k: ['']*len(x) for k in states} # TraceBack Table
    for i in range(1, len(x)):
        for k in states:
            max_val, t[k][i] = max((v[r][i-1] + math.log(a.get(r+k, sys.float_info.min)), r) for r in states)
            v[k][i] = math.log(e.get(k+x[i], sys.float_info.min)) + max_val
    return v, t

if __name__ == '__main__': 
    # Data Parsing & Counting
    with open("set83.txt") as data_file: 
        lines = data_file.readlines() 
    names, X, Pi, Pi_star, V, T, count_a, count_e, accuracy3, accuracy4, FOLD, n = [[None]*(len(lines)//4) for i in range(6)] + [[], [], [0]*10, [0]*10, 10, 0]
    for names[n], X[n], Pi[n] in ((lines[i].strip('>\n\r\t '), lines[i+1].strip('\n\r\t '), list(lines[i+2].strip('\n\r\t '))) for i in range(0, len(lines), 4)):
        pre_state = Pi[n][0]
        count_e.append({pre_state + X[n][0]:1})
        count_a.append({})
        for state, symbol, i in zip(Pi[n][1:], X[n][1:], range(1, len(X[n]))):
            if (pre_state == 'I' and state == 'H') or (pre_state == '1' and state == 'H'):
                Pi[n][i] = state = '1'            
            if (pre_state == 'O' and state == 'H') or (pre_state == '2' and state == 'H'):
                Pi[n][i] = state = '2' 
            count_a[-1][pre_state + state] = count_a[-1].get(pre_state + state, 0) + 1
            count_e[-1][state + symbol] = count_e[-1].get(state + symbol, 0) + 1
            pre_state = state
        n += 1
    # Training & Tesing (10 fold)  
    groups = [(q*i, (q+1)*i-FOLD+res)[i > FOLD-res] for q, res in (divmod(len(names), FOLD),) for i in range(FOLD+1)] # index partition :[0, 8, 16, 24, 32, 40, 48, 56, 65, 74, 83]
    a_all, e_all = sum((collections.Counter(d) for d in count_a), collections.Counter()), sum((collections.Counter(d) for d in count_e), collections.Counter()) # count of all
    for j in range(FOLD): # all *1.0 to make python2 perform true point division
        a_j, e_j = sum((collections.Counter(d) for d in count_a[groups[j]:groups[j+1]]), collections.Counter()), sum((collections.Counter(d) for d in count_e[groups[j]:groups[j+1]]), collections.Counter())# count of testing set to be excluded
        a, e = {k_all: v_all-v_j for k_all, v_all in a_all.items() for k_j, v_j in a_j.items() if  k_j == k_all}, {k_all: v_all-v_j for k_all, v_all in e_all.items() for k_j, v_j in e_j.items() if  k_j == k_all} # count of training set 
        a, e = {key: a[key]*1.0/sum(a.get(key[0] + each, 0) for each in 'OI12') for key in a.keys()}, {key: e[key]*1.0/sum(e.get(key[0] + each, 0) for each in 'ACDEFGHIKLMNPQRSTVWY') for key in e.keys()} # calculate probability
        for n in range(groups[j], groups[j+1]): # proteins for testing
            V[n], T[n] = Viterbi(X[n], 'OI12', e, a, {'O': 0.5, 'I':0.5, '1':sys.float_info.min, '2':sys.float_info.min})
            state = max((V[n][r][-1], r) for r in 'OI12')[1] # the last state in Pi_star
            Pi_star[n] = state
            for i in range(len(X[n])-1, -1, -1): # TraceBack
                accuracy3[j] += state == Pi[n][i] or ((state == '1' or state == '2') and (Pi[n][i] == '1' or Pi[n][i] == '2')) # 3-state
                accuracy4[j] += state == Pi[n][i] # 4-state
                state = T[n][state][i] # the previous state in Pi_star
                Pi_star[n] = state + Pi_star[n] # note that the first element in T should be ''
            sys.stdout.write('>' + names[n] + '\n' + X[n] + '\nActual path:\n' + ''.join(Pi[n]) + '\nPredicted path:\n' + Pi_star[n] + '\n')
        accuracy3[j], accuracy4[j] = (acc*1.0/sum(len(X[n]) for n in range(groups[j], groups[j+1])) for acc in (accuracy3[j], accuracy4[j]))
    sys.stdout.write(''.join('\nRound ' + str(j+1) + ':\n\t3-state accuracy: ' + str(accuracy3[j]) + '\n\t4-state accuracy: ' + str(accuracy4[j]) for j in range(FOLD)) + '\n\nAverage of 3-state accuracies = ' + str(sum(accuracy3)/len(accuracy3)) + '\nAverage of 4-state accuracies = ' + str(sum(accuracy4)/len(accuracy4)) + '\n')