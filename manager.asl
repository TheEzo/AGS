parent("agent2", "agent1").
parent("agent3", "agent1").

parent("agent4", "agent2").
parent("agent5", "agent2").
parent("agent6", "agent3").
parent("agent7", "agent3").

parent("agent8", "agent4").
parent("agent9", "agent4").
parent("agent10", "agent5").
parent("agent11", "agent5").
parent("agent12", "agent6").
parent("agent13", "agent6").
parent("agent14", "agent7").
parent("agent15", "agent7").


!start.
!shake.

+!start <-
		.send(agent15, tell, set_val);
		.send(agent15, tell, remove_num);
		.send(agent1, tell, root);
		for(.range(I, 2, 15)){
			.concat(agent, I, N);
			?parent(N,P);
			.send(N, tell, parent(P));
		};
		for(.range(I, 1, 7)){
			.concat(agent, I,N);
			.send(N, tell, node(N));
		};
		for(.range(I, 8, 15)){
			.concat(agent, I, N);
			.send(N, tell, leaf(N));
		};
		.broadcast(tell, set_val);
		.wait(100);
		.broadcast(tell, get_val).
		
+!shake <- .wait(100);  .broadcast(tell, bubble); .wait(100); 
						.broadcast(tell, update); .wait(100); 
						.print("asdfadsf");
						.broadcast(tell, get_val). // for ..8

//+make_sort: 


