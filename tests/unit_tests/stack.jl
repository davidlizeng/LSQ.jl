# hcat test
x = Variable(3);
y = Variable(3, 2);
z = Variable(3, 3);
c = [1; 2; 3];
h = [x y c z];
x.value = [2; 3; 4];
y.value = [5 8; 6 9; 7 0];
z.value = eye(3);
val1 = eval_internals(h, (x, y, z));
val2 = h.evaluate();
@assert all(val1 .== val2);

# vcat test
x = Variable(1, 3);
y = Variable(2, 3);
z = Variable(3, 3);
c = [1 2 3];
v = [x; y; c; z];
x.value = [2 3 4];
y.value = [5 6 7; 8 9 0];
z.value = eye(3);
val1 = eval_internals(v, (x, y, z));
val2 = v.evaluate();
@assert all(val1 .== val2);

# hvcat test
# TODO: add when hvcat is implemented


info("All stack tests passed.")