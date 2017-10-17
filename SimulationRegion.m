classdef SimulationRegion
    properties
        SurfaceState;
        ModelState;
        SurfaceParameter;
        p1X;
        p1Y;
        p2X;
        p2Y;
    end
    methods
        function obj=AssignRegion(obj,SurfaceState,ModelState,SurfaceParameter,p1X,p1Y,p2X,p2Y)
            obj.SurfaceState=SurfaceState;
            obj.ModelState=ModelState;
            obj.SurfaceParameter=SurfaceParameter;
            obj.p1X=p1X;
            obj.p1Y=p1Y;
            obj.p2X=p2X;
            obj.p2Y=p2Y;
        end
    end
end