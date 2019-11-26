+set_val: leaf(T) <- .random(X); Y=math.round(X*100);  +my_number(Y).

+get_val: my_number(Y) <- .print(Y).

//+sort: parent(P) <- .print("My parent is: ", P).
+bubble: parent(P) & my_number(N) <- .my_name(X); .send(P, tell, update_val(N, X)). // .print("Telling ", P, " to update: ", N).

+update: node(C) & val1(X, S1) & val2(Y, S2) & X > Y <- 
		.print(S1," ",X, " > ",S2," ",Y); +my_number(X); .send(S2, untell, my_number(Y)); -val1(X, S1); -val2(Y, S2).
+update: node(C) & val1(X, S1) & val2(Y, S2) & X <= Y <- 
		.print(S2," ",Y, " > ",S1," ",X); +my_number(Y); .send(S1, untell, my_number(X)); -val1(X, S1); -val2(Y, S2).


+update_val(N, S): node(X) & not(val1(_,_)) <- +val1(N, S). // Number, Source
+update_val(N, S): node(X) & val1(_,_) & not(val2(_,_)) <- +val2(N, S). // Number, Source

+val: val1(X) & val2(Y) <- .print(X," <> ", Y).
+val: not(val1(X)) | not(val2(Y)) <- .broadcast(tell, sort); .wait(100); val.

+remove_num: my_number(X) <- -my_number(X).

