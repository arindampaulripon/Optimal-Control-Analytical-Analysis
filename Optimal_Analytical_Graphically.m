syms beta k2 theta k1 p W1 W2 s c  u1 u2 alpha  A2  B2 l1 l2 l3 theta lambda1 lambda2 lambda3  rho phi A1 A2 z b0 alpha a al gamma delta beta beta n mu v1 v2 v3 lambda S0 P0 C0 u1 u2
prompt = {'Enter Symbol 1:','Enter Symbol 2:','Enter Symbol 3:','Enter Symbol 4:','Enter Symbol 5:','Enter Symbol 6:'};
dlgtitle = 'Input';
dims = [1 35];
definput = {'....','....','....','....','....','....'};
answers = inputdlg(prompt,dlgtitle,dims,definput);
s1 = str2sym(answers{1,1});
s2 = str2sym(answers{2,1});
s3 = str2sym(answers{3,1});

s4 = str2sym(answers{4,1});
s5 = str2sym(answers{5,1});
s6 = str2sym(answers{6,1});
prompt = {'Enter Equation 1:','Enter Equation 2:','Enter Equation 3:','Enter Equation 4:','Enter Equation 5:','Enter Equation 6:'};
dlgtitle = 'Input';
dims = [1 35];
definput = {'....','....','....','....','....','....'};
answer = inputdlg(prompt,dlgtitle,dims,definput);


A = str2sym(answer{1,1});
B = str2sym(answer{2,1});
C = str2sym(answer{3,1});
% D = str2sym(answer{3,1});
% E = str2sym(answer{3,1});
% F = str2sym(answer{3,1});
all = [A;B;C];
A1 = str2sym(answer{1,1}) == 0;
B1 = str2sym(answer{2,1}) == 0 ;
C1 = str2sym(answer{3,1}) == 0;
system = [A1;B1;C1];
sol = solve(system,[p,s,c]);
pp = sol.p;
ss = sol.s;
cc = sol.c;

J = jacobian(all,[p,s,c]);
JK = subs(J,[p,s,c],[pp,ss,cc]);
I = [lambda 0 0; 0 lambda 0; 0 0 lambda];
eq2 = det(JK - I) == 0;
stb = solve(eq2,lambda);


prompt = {'Enter Objective Function' };
dlgtitle = 'Input';
dims = [1 35];
definput = {'....',};
answer3 = inputdlg(prompt,dlgtitle,dims,definput);

F = str2sym(answer3(1,1));
F = F + lambda1*A + lambda2*B + lambda3*C;
G = -gradient(F,[p,s,c]);
p = gradient(F,u1) == 0;
q = gradient(F,u2) == 0;
alll = [p;q];
dd = solve(alll,[u1,u2]);




fprintf('Equllibrium Points are :')
pp = sol.p
ss = sol.s
cc = sol.c

fprintf('Stabilty Criterions are :')
stability = stb


fprintf('Hamiltonian :')
Ham = F


fprintf('Adjoint System:')
Adjoint = G

fprintf('Value of Controls:')
u1 = dd.u1
u2 = dd.u2


% eqn = [];
% iv = [] ;
% for i = 1:3
%     
% prompt = {'Eqn:','IV'};
% dlgtitle = 'Input';
% dims = [1 35];
% definput = {'Eqn:','IV'};
% all = inputdlg(prompt,dlgtitle,dims,definput);
% [eqn] = [eqn;(all{i,1})]
% [iv] = [iv;(all{i,1})]
% end
syms p(t) s(t) c(t)
E = diff(p(t)) ==  str2sym(answer{1,1});
F = diff(s(t)) ==   str2sym(answer{2,1});
U = diff(c(t)) ==   str2sym(answer{3,1});
fprintf('System of Equations :')
ald = [E;F;U]
% vars = [p(t),s(t),c(t)];
% 
