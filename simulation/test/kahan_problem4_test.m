% Test 1
a = 1;
b = 1;
c = 1;
theta = kahan_problem4(a, b, c);
assert(theta == round(2 * pi / 3, 6));

% Test 2
a = 1;
b = 1;
c = 0;
theta = kahan_problem4(a, b, c);
assert(theta == round(pi, 6));

% Test 3
a = 4;
b = 3;
c = 5;
theta = kahan_problem4(a, b, c);
assert(theta == round(pi / 2, 6));

% Test 4
a = 4;
b = 0;
c = 5;
theta = kahan_problem4(a, b, c);
assert(isnan(theta));

% Test 5
a = 3;
b = 5;
c = 7;
theta = kahan_problem4(a, b, c);
assert(theta == round(pi / 3, 6));

fprintf("PASS\n");