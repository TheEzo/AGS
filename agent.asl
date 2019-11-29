+set_val: leaf(T) <- .random(X); Y=math.round(X*100);  +my_number(Y).

+!get_val: my_number(Y) <- .print(Y).
+!get_val.

+!bubble: parent(P) & my_number(N) <- //& (not(val2(_,_)) | not(val1(_,_))) <- 
			.my_name(X); .send(P, achieve, update_val(N, X)).//; .print("Telling ", P, " to update: ", N).
+!bubble.

+!update_val(N, S): node(_) & not(val1(_,_)) & not(val2(_,_)) <- 
			+val1(N, S).
+!update_val(N,S1): node(_) & val1(_,S2) & not(val2(_,_)) & not(S1==S2) <- 
			+val2(N, S1).
+!update_val(N,S1): node(_) & val2(_,S2) & not(val1(_,_)) & not(S1==S2) <-
			+val1(N, S1).
+!update_val(_,_).


+!update: not(my_number(_)) & node(_) & val1(X,S) & val2(Y,_) & X > Y <- 
			+my_number(X); .send(S, achieve, remove_num); -val1(_,_).//; .wait(100); .send(S, achieve, bubble). 
+!update: not(my_number(_)) & node(_) & val1(X,_) & val2(Y,S) & X <= Y <-
			+my_number(Y); .send(S, achieve, remove_num); -val2(_,_).//; .wait(100); .send(S, achieve, bubble).
+!update: not(my_number(_)) & node(_) & val1(X,S) & not(val2(_,_)) <-
			+my_number(X); .send(S, achieve, remove_num); -val1(_,_).
+!update: not(my_number(_)) & node(_) & val2(X,S) & not(val1(_,_)) <- 
			+my_number(X); .send(S, achieve, remove_num); -val2(_,_).
+!update.

+!remove_num <- -my_number(_); .wait(10); !update; .wait(100); !bubble.// -val1(_,_).//; .print("Removing").

+!tree_shake: root & my_number(X) <- !get_val.//; .print("I am root ", X).
+!tree_shake: root & not(my_number(Y)) <- 
			.broadcast(achieve, bubble); .wait(100); //.broadcast(achieve, bubble); .wait(100);
			.broadcast(achieve, update); .wait(100); !update; .wait(100); //.broadcast(achieve, get_val); .wait(1000); .print("#####################################"); 
			!tree_shake.


