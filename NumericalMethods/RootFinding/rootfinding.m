%% John DeSalvo

TOL = 1e-7 %tolerance
N = 200 %maximum number of iterations

%% a
% For this function, it is shown that the speed of convergence in order 
% from fastest to slowest is: Secant, Regula Falsi, Bisection, Netwon's.
% The performance in terms of error defined as $err_{n} = |x_{n+1} - x_{n}|$
% from lowest to highest is: Newton's, Secant, Bisection, Regula Falsi
f = @(x) 6 + cos(x)^2 - x %the function for this exercise
%the first derivative of the function is computed analytically and defined 
%a priori
df = @(x) -1 - 2*sin(x)*cos(x) 
a = 6; %infimum for the closed interval on which the root lies
b = 7; %supremum for the closed interval on which the root lies
Newtons(f, df, b, TOL, N); %Implementation of Newton's Method
Secant(f, a, b, TOL, N); %Implementation of the Secant Method
Bisect(f, a, b, TOL, N); %Implementation of the Bisection Method
RegFalsi(f, a, b, TOL, N); %Implementation of the Regula Falsi Method

%% b
% For this function, it is shown that the speed of convergence in order 
% from fastest to slowest is: Bisection/Regula Falsi, Secant, Netwon's.
% The performance in terms of error defined as $err_{n} = |x_{n+1} - x_{n}|$
% from lowest to highest is: Secant/Newton's Bisection/Regula Falsi
f = @(x) (x - 1.5)^5 %the function for this exercise
%the first derivative of the function is computed analytically and defined 
%a priori
df = @(x) 5*(x - 1.5)^4
a = 1; %infimum for the closed interval on which the root lies
b = 2; %supremum for the closed interval on which the root lies
Newtons(f, df, b, TOL, N); %Implementation of Newton's Method
Secant(f, a, b, TOL, N); %Implementation of the Secant Method
Bisect(f, a, b, TOL, N); %Implementation of the Bisection Method
RegFalsi(f, a, b, TOL, N); %Implementation of the Regula Falsi Method

%% c
% For this function, it is shown that the speed of convergence in order 
% from fastest to slowest is: Secant, Newton's, Bisection, Regula Falsi.
% The performance in terms of error defined as $err_{n} = |x_{n+1} - x_{n}|$
% from lowest to highest is: Newton's, Secant, Bisection, Regula Falsi
f = @(x) x^5 - 1.5 %the function for this exercise
%the first derivative of the function is computed analytically and defined 
%a priori
df = @(x) 5*x^4
a = 1; %infimum for the closed interval on which the root lies
b = 2; %supremum for the closed interval on which the root lies
Newtons(f, df, b, TOL, N); %Implementation of Newton's Method
Secant(f, a, b, TOL, N); %Implementation of the Secant Method
Bisect(f, a, b, TOL, N); %Implementation of the Bisection Method
RegFalsi(f, a, b, TOL, N); %Implementation of the Regula Falsi Method

%% d
% For this function, it is shown that the speed of convergence in order 
% from fastest to slowest is: Secant, Regula Falsi, Bisection, Netwon's.
% The performance in terms of error defined as $err_{n} = |x_{n+1} - x_{n}|$
% from lowest to highest is: Bisection, Newton's, Secant, Regula Falsi,
f = @(x) x^3 - 2*x^2 + 1.5*x %the function for this exercise
%the first derivative of the function is computed analytically and defined 
%a priori
df = @(x) 3*x^2 - 4*x + 1.5
a = -1; %infimum for the closed interval on which the root lies
b = 1; %supremum for the closed interval on which the root lies
Newtons(f, df, b, TOL, N); %Implementation of Newton's Method
Secant(f, a, b, TOL, N); %Implementation of the Secant Method
Bisect(f, a, b, TOL, N); %Implementation of the Bisection Method
RegFalsi(f, a, b, TOL, N); %Implementation of the Regula Falsi Method

%% e
% For this function, it is shown that the speed of convergence in order 
% from fastest to slowest is: Newton's, Secant, Bisection, Regula Falsi.
% The performance in terms of error defined as $err_{n} = |x_{n+1} - x_{n}|$
% from lowest to highest is: Newton's, Secant, Bisection, Regula Falsi
f = @(x) 2*x^3 - 15*x^2 + 36*x - 23 %the function for this exercise
%the first derivative of the function is computed analytically and defined 
%a priori
df = @(x) 6*x^2 - 30*x + 36
a = 0.5; %infimum for the closed interval on which the root lies
b = 3.5; %supremum for the closed interval on which the root lies
Newtons(f, df, b, TOL, N); %Newton's Method starting with 3.5
Newtons(f, df, a, TOL, N); %Newton's Method starting with 0.5
Secant(f, a, b, TOL, N); %The Secant Method with x0 = 0.5 and x1 = 3.5
Secant(f, b, a, TOL, N); %The Secant Method with x0 = 3.5 and x1 = 0.5
Bisect(f, a, b, TOL, N); %Implementation of the Bisection Method
RegFalsi(f, a, b, TOL, N); %Regula Falsi with x0 = 0.5 and x1 = 3.5
RegFalsi(f, b, a, TOL, N); %Regula Falsi with x0 = 3.5 and x1 = 0.5

%% Newton's Method
% function nwtn = Newtons(f, df, x0, TOL, N)
  %  x = [];
  %  x(1) = x0;
  %  i = 2;
  %  x(2) = f(x0);
  %  while(abs(x(i) - x(i-1)) > TOL && i <= N)
  %      i = i + 1;
  %      x(i) = x(i-1) - f(x(i-1))/df(x(i-1));
  %  end
  %  nwtn = x(i)
  %  i
  %  err = abs(x(i) - x(i-1))
%end

%% The Secant Method
%function sec = Secant(f, x0, x1, TOL, N)
%    x = [];
%    x(1) = x0;
%    x(2) = x1;
%    i = 2;
%    while(abs(x(i) - x(i-1)) > TOL && i <= N)
%        i = i + 1;
%        x(i) = x(i-1) - (f(x(i-1))*(x(i-1)-x(i-2)))/(f(x(i-1)) - f(x(i-2)));
%    end
%    sec = x(i)
%    i
%    err = abs(x(i) - x(i-1))
%end

%% The Bisection Method
%function bis =Bisect(f, a, b, TOL, N)
%    i = 0;
%    fa = f(a);
%    fb = f(b);
%    while (abs((b-a)/2) > TOL && i <= N)
%        bis = (a + b)/2;
%        fc = f(bis);
%        if (fc == 0)
%            break;
%        end
%        if (sign(fa)*sign(fc) < 0)
%            b = bis;
%            fb = fc;
%        else
%            a = bis;
%            fa = fc;
%        end
%        i = i + 1;    
%    end
%    bis = (a + b)/2
%    i
%    err = abs((b-a)/2)
%end

%% The Regula Falsi Method
%function rf = RegFalsi(f, a, b, TOL, N)
%    i = 0;
%    fa = f(a);
%    fb = f(b);
%    while (abs((b-a)/2) > TOL && i <= N)
%        rf = (b*fa - a*fb)/(fa-fb);
%        fc = f(rf);
%        if (fc == 0)
%            break;
%        end
%        if (sign(fa)*sign(fc) < 0)
%            b = rf;
%            fb = fc;
%        else
%            a = rf;
%            fa = fc;
%        end
%        i = i + 1;    
%    end
%    rf = (b*fa - a*fb)/(fa-fb)
%    i
%    err = abs((b-a)/2)
%end

