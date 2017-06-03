%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Author: Ed Ekpoudom
%  Last Updated: 27 January 2017
%  MATLAB is a registered trademark of The MathWorks, Inc. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
classdef MATLABRegression
       properties
           endog;
           exog;
           betahat;
       end
       methods
           function self = MATLABRegression(filename)
               if(nargin > 0)
                 M = csvread(filename);  
                 self.exog = M(:,1:14);
                 self.endog = M(:,15);
                 self.betahat = [];
                 self.betahat = self.fit();
                 self.print_output(self);
               end
           end
       end
       methods(Access = 'private')
           function beta = fit(self)
               if issparse(self.exog)
                   R = qr(self.exog); 
               else
                   R = triu(qr(self.exog));
               end
               beta = R\(R'\(self.exog'*self.endog));
               r = self.endog - self.exog*beta;
               err = R\(R'\(self.exog'*r));
               beta = beta + err;
           end
       end
       methods(Static = true)
           function print_output(self)
               fprintf('Coefficients:\n\n')
               fprintf('Intcpt \t= %6.4f\n',self.betahat(1,1))
               fprintf('crim \t= %6.4f\n',self.betahat(2,1))
               fprintf('zn  \t= %6.4f\n',self.betahat(3,1))
               fprintf('indus \t= %6.4f\n',self.betahat(4,1))
               fprintf('chas \t= %6.4f\n',self.betahat(5,1))
               fprintf('nox \t= %6.4f\n',self.betahat(6,1))
               fprintf('rm  \t= %6.4f\n',self.betahat(7,1))
               fprintf('age \t= %6.4f\n',self.betahat(8,1))
               fprintf('dis \t= %6.4f\n',self.betahat(9,1))
               fprintf('rad \t= %6.4f\n',self.betahat(10,1))
               fprintf('tax \t= %6.4f\n',self.betahat(11,1))
               fprintf('ptrtio \t= %6.4f\n',self.betahat(12,1))
               fprintf('black \t= %6.4f\n',self.betahat(13,1))
               fprintf('lstat \t= %6.4f\n',self.betahat(14,1))
           end
        end
end

