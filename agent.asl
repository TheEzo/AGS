//+get_val: leaf(X) <- .print("I am leaf").
//+get_val: node(X) <- .print("I am node").
//+set_val: parent(X) <- .print("My parent is ", X).

+set_val: leaf(T) <- .random(X); Y=math.round(X*100);  +my_number(Y).

+get_val: leaf(T) <- ?my_number(Y); .print(Y).

