classdef Line 
    properties
        LineName;
        LineX;
        LineY;
        LineLength;
        LineDirection;
        Distance;
        Sag;
        MySimulationRegion;
        MyCircuit;
    end
    methods
        function obj=AssignLine(obj,Name,X,Y,Length,Direction,Distance,Sag)
            obj.LineName=Name;
            obj.LineX=X;
            obj.LineY=Y;
            obj.LineLength=Length;
            obj.LineDirection=Direction;
            obj.Distance=Distance;
            obj.Sag=Sag;
        end
    end
end