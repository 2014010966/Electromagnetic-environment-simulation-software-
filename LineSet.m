classdef LineSet
    properties
        LineIndex=[];
        LineChoose;
        DataPath;
%     end
%     properties(Dependent)
        LineName;
        LineX;
        LineY;
        LineLength;
        LineDirection;
        Distance;
        Sag;
        LineCheck=0;
    end
    methods
        function obj=Add(obj,Name,X,Y,Length,Direction,Distance,Sag)
            L=length(obj.LineIndex);
            if(L==0)
                obj.LineIndex=Line;
            else
                obj.LineIndex(L+1)=Line;
            end
            obj.LineIndex(L+1)=obj.LineIndex(L+1).AssignLine(Name,X,Y,Length,Direction,Distance,Sag);
            obj.LineChoose=L+1;
            obj.LineName=[obj.LineName,Name];
            obj.LineX=[obj.LineX,X];
            obj.LineY=[obj.LineY,Y];
            obj.LineLength=[obj.LineLength,Length];
            obj.LineDirection=[obj.LineDirection,Direction];
            obj.Distance=[obj.Distance,Distance];
            obj.Sag=[obj.Sag,Sag];
            obj.LineCheck=1;
        end
        function obj=Delete(obj)
            obj.LineIndex(obj.LineChoose)=[];
            obj.LineName(obj.LineChoose)=[];
            obj.LineX(obj.LineChoose)=[];
            obj.LineY(obj.LineChoose)=[];
            obj.LineLength(obj.LineChoose)=[];
            obj.LineDirection(obj.LineChoose)=[];
            obj.Distance(obj.LineChoose)=[];
            obj.Sag(obj.LineChoose)=[];
            if(obj.LineChoose>1)
                obj.LineChoose=obj.LineChoose-1;
            else
                obj.LineChoose=1;
            end
            obj.LineCheck=1;
        end
        function obj=Change(obj,Name,X,Y,Length,Direction,Distance,Sag)
            obj.LineIndex(obj.LineChoose)=obj.LineIndex(obj.LineChoose).AssignLine(Name,X,Y,Length,Direction,Distance,Sag);
            if(strcmp(obj.LineName(obj.LineChoose),cellstr(Name))&&obj.LineX(obj.LineChoose)==X&&obj.LineLength(obj.LineChoose)==Length&&obj.LineDirection(obj.LineChoose)==Direction&&obj.Distance(obj.LineChoose)==Distance&&obj.Sag(obj.LineChoose)==Sag)
                ;
            else
                obj.LineCheck=1;
            end
            obj.LineName(obj.LineChoose)=Name;
            obj.LineX(obj.LineChoose)=X;
            obj.LineY(obj.LineChoose)=Y;
            obj.LineLength(obj.LineChoose)=Length;
            obj.LineDirection(obj.LineChoose)=Direction;
            obj.Distance(obj.LineChoose)=Distance;
            obj.Sag(obj.LineChoose)=Sag;
        end
    end
end     