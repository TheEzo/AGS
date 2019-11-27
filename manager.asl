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

+!start <-
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
		.broadcast(achieve, get_val);
		!shake.
		
+!shake <- .wait(100);  .send(agent1, achieve, tree_shake). // .wait(1000);
						//.broadcast(tell, bubble); .wait(200); 
						//.broadcast(tell, update); .wait(100).
						//.print("###########################");
						//.broadcast(tell, bubble); .wait(100);
						//.broadcast(achieve, get_val).
						//.print("");
+!bubble.
+!update.
+!get_val.
//+make_sort: 


