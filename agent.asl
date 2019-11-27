+set_val: leaf(T) <- .random(X); Y=math.round(X*100);  +my_number(Y).

+!get_val: my_number(Y) <- .print(Y).
+!get_val.

+!bubble: parent(P) & my_number(N) & (not(val2(_,_)) | not(val1(_,_))) <- 
			.my_name(X); .send(P, achieve, update_val(N, X)).//; .print("Telling ", P, " to update: ", N).
+!bubble.

+!update_val(N, S): not(my_number(_)) & node(_) & not(val1(_,_)) <- +val1(N, S). 						    // Number, Source
+!update_val(N,S1): not(my_number(_)) & node(_) & val1(_,S2) & not(val2(_,_)) <- +val2(N, S1). // Number, Source
+!update_val(_,_).


+!update: not(my_number(_)) & node(_) & val1(X,S) & val2(Y,_) & X > Y <- .print("Setting: ", X, ">", Y); 
			+my_number(X); .send(S, achieve, remove_num); -val1(_,_); -val2(_,_).
+!update: not(my_number(_)) & node(_) & val1(X,_) & val2(Y,S) & X <= Y <- .print("Setting: ", Y, ">", X); 
			+my_number(Y); .send(S, achieve, remove_num); -val1(_,_); -val2(_,_).
+!update: not(my_number(_)) & node(_) & val1(X,S) & not(val2(_,_)) <- .print("Setting: ", X); 
			+my_number(X); .send(S, achieve, remove_num); -val1(_,_).
+!update.


+!remove_num <- -my_number(_); .print("Removing").



+!tree_shake: root & my_number(X) <- .print("I am root ", X).
+!tree_shake: root & not(my_number(Y)) <- 
			.broadcast(achieve, bubble); .wait(200); .broadcast(achieve, bubble); .wait(200);
			.broadcast(achieve, update); .wait(200); .broadcast(achieve, get_val); .wait(1000); !tree_shake. //.broadcast(achieve, get_val). //!sorting(X).







