child("agent1", "agent2").
child("agent1", "agent3").

child("agent2", "agent4").
child("agent2", "agent5").
child("agent3", "agent6").
child("agent3", "agent7").

child("agent4", "agent8").
child("agent4", "agent9").
child("agent5", "agent10").
child("agent5", "agent11").
child("agent6", "agent12").
child("agent6", "agent13").
child("agent7", "agent14").
child("agent7", "agent15").



!start.
!get_values.
!shake.

+!start <-
		for(.range(I, 1, 7)){
			.concat(agent, I, N);
			?child(N,P);
			.send(N, tell, child(P));
		};
		for(.range(I, 2, 7)){
			.concat(agent, I,N);
			.send(N, tell, node(N));
		};
		for(.range(I, 8, 15)){
			.concat(agent, I, N);
			.send(N, tell, leaf(N));
		};
		.broadcast(tell, set_val).		
+!get_values <- .wait(100); .broadcast(tell, get_val).
+!shake <- .breadcast(tell, shake).



