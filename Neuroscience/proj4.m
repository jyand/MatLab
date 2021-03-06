%% John DeSalvo

%% Hodgkin Huxley Model

dt = 0.01 ;
t = 0:dt:2 ;

% Physical Parameters
Iapp  = 0 ;
Io = 0:4 ;
Cm = 1 ;
El = -52 ;
Ena = 55 ;
Ek = -75 ;
Gl = 0.3 ;
Gna = 120 ;
Gk = 36 ;

% activation/inactivation/gating variables and time scales
M = @(x) 1/(1 + exp((-1*x - 40)/9)) ;
H = @(x) 1/(1 + exp((x - 62)/10)) ;
N = @(x) 1/(1 + exp((-1*x - 53)/16)) ;
Tm = 0.3 ;
Th = @(x) 1 + 11/(1 + exp((x - 62)/10)) ;
Tn = @(x)1 + 6/(1 + exp((x + 53)/16)) ;

% general form for activation/inactivation/gating ODES
f = @(x, y, z) (x - y)/z ;

% General HH ODE
g = @(w, x, y, z) 1/Cm*(w - x - y - z) ;

V(1) = -60 ;
m(1) = 0 ;
h(1) = 1 ;
n(1) = 0 ;

% Runge-Kutta-2 Method to solve for V(t), m, n, and h
for j = 1:length(Io)
        for i = 1:length(t)-1
                if t > 1
                        Iapp = Io(j) ;
                end

                k(1) = f(M(V(i)), m(i), Tm(V(i))) ;
                k(2) = f(M(V(i)), m(i) + dt*k(1), Tm(V(i)))
                m(i+1) = V(i) + dt*sum(k)/2 ;

                k(1) = f(M(V(i)), h(i), Tm(V(i))) ;
                k(2) = f(M(V(i)), h(i) + dt*k(1), Tm(V(i)))
                h(i+1) = V(i) + dt*sum(k)/2 ;

                k(1) = f(M(V(i)), n(i), Tm(V(i))) ;
                k(2) = f(M(V(i)), n(i) + dt*k(1), Tm(V(i)))
                n(i+1) = V(i) + dt*sum(k)/2 ;

                Ik = Gk*n(i).^4 *(V(i) - Ek) ;
                Ina = Gna*m(i).^3 *(V(i) - Ena) ;
                Il = Gl(V(i) - El) ;
                k(1) = g(Iapp, Ik + dt*k(1), Ina + dt*k(1), Il + dt*k(1)) ; 
                k(2) = g(Iapp, Ik + dt*k(1), Ina + dt*k(1), Il + dt*k(1)) ;
                V(i+1) = V(i) + dt*sum(k)/2 ;
        end
        Iapp = 0 ;
end

figure(1)
plot(V, M(V), H(V), N(V))

figure(2)
plot(V, Tm, Th(V), Tn(V))

%% Inhibtory Cell Model
% Based on 'Gamma rhythms and beta rhythms have different synchronization properties' PNAS 1999

