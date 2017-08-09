classdef LinOpAdjoint < LinOp
    %% Adjoint : overload of adjoint function for LinOp
    %  Matlab Linear Operator Library
    %
    % Example
    % Obj = Adjoint(LinOp)
    % Obj is the adjoint of the LinOp
    %
    %
    %
    % Please refer to the LINOP superclass for general documentation about
    % linear operators class
    % See also LinOp
    
    %     Copyright (C) 2015 F. Soulez ferreol.soulez@epfl.ch
    %
    %     This program is free software: you can redistribute it and/or modify
    %     it under the terms of the GNU General Public License as published by
    %     the Free Software Foundation, either version 3 of the License, or
    %     (at your option) any later version.
    %
    %     This program is distributed in the hope that it will be useful,
    %     but WITHOUT ANY WARRANTY; without even the implied warranty of
    %     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    %     GNU General Public License for more details.
    %
    %     You should have received a copy of the GNU General Public License
    %     along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    properties (SetAccess = protected,GetAccess = public)
        TLinOp     % linop
    end
    
    methods 
        function this = LinOpAdjoint(TLinOp)
            this.name =sprintf('%s Adjoint', TLinOp.name);           
            assert(isa(TLinOp,'LinOp'),'Input should be a  LinOp');
            this.TLinOp = TLinOp;
            this.isComplex= this.TLinOp.isComplex;
            this.isInvertible=this.TLinOp.isInvertible;
            this.sizein =  this.TLinOp.sizeout;
            this.sizeout =  this.TLinOp.sizein;			
			this.norm = this.TLinOp.norm;        
		end
        
	end
	
	methods (Access = protected)
        function y = apply_(this,x) % apply the operator         
            y =this.TLinOp.applyAdjoint(x);
        end
        function y = adjoint_(this,x) % apply the adjoint
            y =this.TLinOp.apply(x);
        end
        function y = HtH_(this,x)
            y =this.TLinOp.HHt(x);
        end
        function y = HHt_(this,x)
            y =this.TLinOp.HtH(x);
        end
        function y = inverse_(this,x)
            y =this.TLinOp.applyInverse(x);
        end
        function y = adjointInverse_(this,x)
            y =this.TLinOp.applyAdjointInverse(x); 
        end
    end
end
