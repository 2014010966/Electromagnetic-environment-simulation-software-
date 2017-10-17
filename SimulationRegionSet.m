classdef SimulationRegionSet
    properties
        SimulationRegionIndex;
        SimulationRegionChoose;
    end
    methods
        function obj=Add(obj,SurfaceState,ModelState,SurfaceParameter,p1X,p1Y,p2X,p2Y)
            L=length(obj.SimulationRegionIndex);
            obj.SimulationRegionIndex(L+1).AssignRegion(SurfaceState,ModelState,SurfaceParameter,p1X,p1Y,p2X,p2Y);
            obj.SimulationRegionChoose=L+1;
        end
        function obj=Change(obj,SurfaceState,ModelState,SurfaceParameter,p1X,p1Y,p2X,p2Y)
            obj.SimulationRegionIndex(obj.SimulationRegionChoose).AssignRegion(SurfaceState,ModelState,SurfaceParameter,p1X,p1Y,p2X,p2Y);
        end
        function obj=Delete(obj)
            obj.SimulationRegionIndex(obj.SimulationRegionChoose)=[];
            if(obj.SimulationRegionChoose>1)
                obj.SimulationRegionChoose=obj.SimulationRegionChoose-1;
            else
                obj.SimulationRegionChoose=1;
            end
        end
    end
end

